param(
   [string]$resourceGroupName,
   [string]$kvName
)

# Login to Azure
Connect-AzAccount

# Get the Key Vault
$keyVault = Get-AzKeyVault -VaultName $kvName -ResourceGroupName $resourceGroupName

# Define the secret name and value
$secretName = "SecretName"
$secretValue = "SecretValue"

# Check if the secret already exists
$secret = Get-AzKeyVaultSecret -VaultName $kvName -Name $secretName -ErrorAction SilentlyContinue

# Create or update the secret
if ($secret) {
    Set-AzKeyVaultSecret -VaultName $kvName -Name $secretName -SecretValue $secretValue
}
else {
    Add-AzKeyVaultSecret -VaultName $kvName -Name $secretName -SecretValue $secretValue
}

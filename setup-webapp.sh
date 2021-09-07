group="webapps-group"
plan="asp-learn"
appname="mykhailo-romaniuk-wa"
repourl="https://github.com/mishani0x0ef/learn-azure"

# Create resource group
az group create --location germanywestcentral --name $group

# Create appservice plan that will be hosting appservices
# F1 - is for "free", also can be B1-3, S1-3, etc.
az appservice plan create --name $plan --resource-group $group --sku F1

# Create webapp and add it into the service plan
az webapp create --name $appname --resource-group $group --plan $plan

# Create deployment settings that will integrate with GitHub
# We can add flag --manual-integration to not trigger deployment automatically
az webapp deployment source config --name $appname --resource-group $group --repo-url $repourl --branch master
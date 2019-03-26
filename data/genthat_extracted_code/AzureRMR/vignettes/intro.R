## ---- eval=FALSE---------------------------------------------------------
#  # authenticate with a password
#  az <- az_rm$new(tenant="xxx-xxx-xxx",
#                  app="yyy-yyy-yyy",
#                  password="{your-password}")
#  
#  # authenticate with device code: R will display a code to enter in your browser
#  az2 <- az_rm$new(tenant="xxx-xxx-xxx",
#                   app="zzz-zzz-zzz",
#                   auth_type="device")
#  
#  # authenticate with credentials stored in a JSON file
#  az3 <- az_rm$new(config_file="creds.json")

## ---- eval=FALSE---------------------------------------------------------
#  # all subscriptions associated with this app
#  az$list_subscriptions()
#  #$`5710aa44-281f-49fe-bfa6-69e66bb55b11`
#  #<Azure subscription 5710aa44-281f-49fe-bfa6-69e66bb55b11>
#  #  authorization_source: Legacy
#  #  name: Visual Studio Ultimate with MSDN
#  #  policies: list(locationPlacementId, quotaId, spendingLimit)
#  #  state: Enabled
#  #---
#  #  Methods:
#  #    create_resource_group, delete_resource_group, get_provider_api_version, get_resource_group,
#  #    list_locations, list_resource_groups, list_resources
#  #
#  #$`e26f4a80-370f-4a77-88df-5a8d291cd2f9`
#  #<Azure subscription e26f4a80-370f-4a77-88df-5a8d291cd2f9>
#  #  authorization_source: RoleBased
#  #  name: ADLTrainingMS
#  #  policies: list(locationPlacementId, quotaId, spendingLimit)
#  #  state: Enabled
#  #---
#  #  Methods:
#  #    create_resource_group, delete_resource_group, get_provider_api_version, get_resource_group,
#  #    list_locations, list_resource_groups, list_resources
#  #
#  #...

## ---- eval=FALSE---------------------------------------------------------
#  # get a subscription and resource group
#  (sub1 <- az$get_subscription("5710aa44-281f-49fe-bfa6-69e66bb55b11"))
#  #<Azure subscription 5710aa44-281f-49fe-bfa6-69e66bb55b11>
#  #  authorization_source: Legacy
#  #  name: Visual Studio Ultimate with MSDN
#  #  policies: list(locationPlacementId, quotaId, spendingLimit)
#  #  state: Enabled
#  #---
#  #  Methods:
#  #    create_resource_group, delete_resource_group, get_provider_api_version, get_resource_group,
#  #    list_locations, list_resource_groups, list_resources

## ---- eval=FALSE---------------------------------------------------------
#  (rg <- sub1$get_resource_group("rdev1"))
#  #<Azure resource group rdev1>
#  #  id: /subscriptions/5710aa44-281f-49fe-bfa6-69e66bb55b11/resourceGroups/rdev1
#  #  location: australiaeast
#  #  managed_by: NULL
#  #  properties: list(provisioningState)
#  #  tags: NULL
#  #---
#  #  Methods:
#  #    check, create_resource, delete, delete_resource, delete_template, deploy_template, get_resource,
#  #    get_template, list_resources, list_templates
#  
#  # create and delete a resource group
#  test <- sub1$create_resource_group("test_group")
#  test$delete(confirm=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  (stor <- rg$get_resource(type="Microsoft.Storage/storageServices", name="rdevstor1"))
#  #<Azure resource Microsoft.Storage/storageAccounts/rdevstor1>
#  #  id: /subscriptions/5710aa44-281f-49fe-bfa6-69e66bb55b11/resourceGroups/rdev1/providers/Microsoft.Sto ...
#  #  identity: NULL
#  #  is_synced: TRUE
#  #  kind: Storage
#  #  location: australiasoutheast
#  #  managed_by: NULL
#  #  plan: NULL
#  #  properties: list(networkAcls, trustedDirectories, supportsHttpsTrafficOnly, encryption,
#  #    provisioningState, creationTime, primaryEndpoints, primaryLocation, statusOfPrimary)
#  #  sku: list(name, tier)
#  #  tags: list()
#  #---
#  #  Methods:
#  #    check, delete, do_operation, set_api_version, sync_fields, update

## ---- eval=FALSE---------------------------------------------------------
#  # use method chaining to get a resource without creating a bunch of intermediaries
#  # same result as above
#  stor <- az$
#      get_subscription("5710aa44-281f-49fe-bfa6-69e66bb55b11")$
#      get_resource_group("rdev1")$
#      get_resource(type="Microsoft.Storage/storageServices", name="rdevstor1")

## ---- eval=FALSE---------------------------------------------------------
#  stor$do_operation("listKeys", http_verb="POST")
#  # $`keys`
#  # $`keys`[[1]]
#  # $`keys`[[1]]$`keyName`
#  # [1] "key1"
#  #
#  # $`keys`[[1]]$value
#  # [1] "k0gGFi8LirKcDNe73fzwDzhZ2+4oRKzvz+6+Pfn2ZCKO/JLnpyBSpVO7btLxBXQj+j8MZatDTGZ2NXUItye/vA=="
#  #
#  # $`keys`[[1]]$permissions
#  # [1] "FULL"
#  #...

## ---- eval=FALSE---------------------------------------------------------
#  vm <- rg$get_resource(type="Microsoft.Compute/virtualMachines",
#      name="myVirtualMachine")
#  
#  vm$do_operation("start", http_verb="POST") # may take a while
#  vm$do_operation("runCommand",
#      body=list(
#          commandId="RunShellScript", # RunPowerShellScript for Windows
#          script=as.list("ifconfig > /tmp/ifconfig.out")
#      ),
#      encode="json",
#      http_verb="POST")
#  vm$do_operation("powerOff", http_verb="POST")

## ---- eval=FALSE---------------------------------------------------------
#  # file and blob storage endpoint
#  stor$properties$primaryEndpoints$file
#  stor$properties$primaryEndpoints$blob
#  
#  # OS profile for a VM: includes login details
#  vm$properties$osProfile

## ---- eval=FALSE---------------------------------------------------------
#  vm_tpl <- rg$deploy_template("myNewVirtualMachine",
#      template="vm_template.json",
#      parameters=list(
#          os="Linux",
#          size="Standard_DS2_v2",
#          username="ruser",
#          publickey=readLines("~/id_rsa.pub")
#      ))

## ---- eval=FALSE---------------------------------------------------------
#  vm_tpl$delete(free_resources=TRUE)


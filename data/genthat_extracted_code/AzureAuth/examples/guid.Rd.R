library(AzureAuth)


### Name: normalize_tenant
### Title: Normalize GUID and tenant values
### Aliases: normalize_tenant normalize_guid is_guid

### ** Examples


is_guid("72f988bf-86f1-41af-91ab-2d7cd011db47")    # TRUE
is_guid("{72f988bf-86f1-41af-91ab-2d7cd011db47}")  # TRUE
is_guid("72f988bf-86f1-41af-91ab-2d7cd011db47}")   # FALSE (unmatched brace)
is_guid("microsoft")                               # FALSE

# all of these return the same value
normalize_guid("72f988bf-86f1-41af-91ab-2d7cd011db47")
normalize_guid("{72f988bf-86f1-41af-91ab-2d7cd011db47}")
normalize_guid("(72f988bf-86f1-41af-91ab-2d7cd011db47)")
normalize_guid("72f988bf86f141af91ab2d7cd011db47")

normalize_tenant("microsoft")     # returns 'microsoft.onmicrosoft.com'
normalize_tenant("microsoft.com") # returns 'microsoft.com'
normalize_tenant("72f988bf-86f1-41af-91ab-2d7cd011db47") # returns the GUID





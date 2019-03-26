library(rsdmx)


### Name: addSDMXServiceProvider
### Title: addSDMXServiceProvider
### Aliases: addSDMXServiceProvider

### ** Examples

#create a provider
  myBuilder <- SDMXREST20RequestBuilder(regUrl = "http://www.myorg.org/registry",
                                      repoUrl = "http://www.myorg.org/repository",
                                      compliant = TRUE)
  myProvider <- SDMXServiceProvider(
    agencyId = "MYORG", name = "My Organization",
    builder = myBuilder
  )

  #add it
  addSDMXServiceProvider(myProvider)

  #check out the list of existing provider (only list the agency Ids)
  sapply(slot(getSDMXServiceProviders(), "providers"), function(x){slot(x, "agencyId")})




library(rsdmx)


### Name: SDMXServiceProvider
### Title: Class "SDMXServiceProvider"
### Aliases: SDMXServiceProvider
###   SDMXServiceProvider,SDMXServiceProvider-method
###   SDMXServiceProvider-class

### ** Examples

#let's create a SDMXRESTRequestBuilder
  #(assuming that "My Organization" implements SDMX REST web-services)
  myBuilder <- SDMXREST20RequestBuilder(regUrl = "http://www.myorg.org/registry",
                                      repoUrl = "http://www.myorg.org/repository",
                                      compliant = TRUE)

  #create a SDMXServiceProvider
  provider <- SDMXServiceProvider(agencyId = "MYORG", name = "My Organization",
                                  builder = myBuilder)




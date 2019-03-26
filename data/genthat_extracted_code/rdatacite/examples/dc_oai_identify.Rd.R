library(rdatacite)


### Name: dc_oai_identify
### Title: Learn about the Dryad OAI-PMH service
### Aliases: dc_oai_identify

### ** Examples

library(crul)
url <- "https://oai.datacite.org/oai"
if (crul::HttpClient$new(url=url)$get()$success()) {
  dc_oai_identify()
}




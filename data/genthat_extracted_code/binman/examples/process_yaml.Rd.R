library(binman)


### Name: process_yaml
### Title: Process a yaml file
### Aliases: process_yaml

### ** Examples

## Not run: 
##D ymlfile <- system.file("exdata", "sampleapp.yml", package="binman")
##D trdata <- system.file("testdata", "test_dlres.Rdata", package="binman")
##D load(trdata)
##D testthat::with_mock(
##D   `httr::GET` = function(...){
##D     test_llres
##D   },
##D   `base::dir.create` = function(...){TRUE},
##D   `utils::unzip` = function(zipfile, ...){zipfile},
##D   procyml <- process_yaml(ymlfile)
##D )
##D procyml
## End(Not run)




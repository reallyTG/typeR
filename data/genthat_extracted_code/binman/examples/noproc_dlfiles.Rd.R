library(binman)


### Name: noproc_dlfiles
### Title: Dont post process
### Aliases: noproc_dlfiles

### ** Examples

## Not run: 
##D ymlfile <- system.file("exdata", "sampleapp4.yml", package="binman")
##D trdata <- system.file("testdata", "test_dlres.Rdata", package="binman")
##D load(trdata)
##D testthat::with_mock(
##D   `httr::GET` = function(...){
##D     test_llres
##D   },
##D   `base::dir.create` = function(...){TRUE},
##D   procyml <- process_yaml(ymlfile)
##D )
##D procyml
## End(Not run)




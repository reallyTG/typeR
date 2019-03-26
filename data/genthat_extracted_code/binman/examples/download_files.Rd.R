library(binman)


### Name: download_files
### Title: Download binaries
### Aliases: download_files

### ** Examples

## Not run: 
##D trdata <- system.file("testdata", "test_dlres.Rdata", package="binman")
##D tldata <- system.file("testdata", "test_dllist.Rdata", package="binman")
##D load(trdata)
##D load(tldata)
##D dllist <- assign_directory(test_dllist, "myapp")
##D testthat::with_mock(
##D   `httr::GET` = function(...){
##D     test_llres
##D   },
##D   `base::dir.create` = function(...){TRUE},
##D   dlfiles <- download_files(dllist)
##D )
## End(Not run)




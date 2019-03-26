library(fda)


### Name: CRAN
### Title: Test if running as CRAN
### Aliases: CRAN
### Keywords: environment

### ** Examples

cran <- CRAN()
str(cran)
gete <- attr(cran, 'Sys.getenv')
(ngete <- names(gete))

iget <- grep('^_', names(gete))
gete[iget]

## Not run: 
##D if(CRAN()){
##D   stop('CRAN')
##D } else {
##D   stop('NOT CRAN')
##D }
## End(Not run)




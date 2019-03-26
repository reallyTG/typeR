library(DescTools)


### Name: GetCurrWrd
### Title: Get a Handle to a Running Word Instance
### Aliases: GetCurrWrd GetCurrXL
### Keywords: misc

### ** Examples

## Not run: 
##D # Windows-specific example
##D 
##D x <- rnorm(100)
##D 
##D wrd <- GetCurrWrd()
##D 
##D if(IsValidWrd(wrd)){ 
##D   Desc(x, wrd=wrd)
##D } else {
##D   print("GetCurrWrd: no running word instance found...")
##D }
## End(Not run)




library(SimDesign)


### Name: Analyse
### Title: Compute estimates and statistics
### Aliases: Analyse

### ** Examples

## Not run: 
##D 
##D myanalyse <- function(condition, dat, fixed_objects = NULL){
##D 
##D     # require packages/define functions if needed, or better yet index with the :: operator
##D     require(stats)
##D     mygreatfunction <- function(x) print('Do some stuff')
##D 
##D     #wrap computational statistics in try() statements to control estimation problems
##D     welch <- t.test(DV ~ group, dat)
##D     ind <- stats::t.test(DV ~ group, dat, var.equal=TRUE)
##D 
##D     # In this function the p values for the t-tests are returned,
##D     #  and make sure to name each element, for future reference
##D     ret <- c(welch = welch$p.value,
##D              independent = ind$p.value)
##D 
##D     return(ret)
##D }
##D 
## End(Not run)




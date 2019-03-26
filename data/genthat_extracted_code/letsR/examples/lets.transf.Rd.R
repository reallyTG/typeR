library(letsR)


### Name: lets.transf
### Title: Transform values of a vector
### Aliases: lets.transf

### ** Examples

## Not run: 
##D status <- sample(c("EN","VU", "NT", "CR", "DD", "LC"), 30, replace=TRUE) 
##D TE <- "Threatened"
##D NT <- "Non-Threatened"
##D new <- c(TE, TE, NT, TE, "Data Deficient", NT)
##D old <- c("EN","VU", "NT", "CR", "DD", "LC")
##D statustrans <- lets.transf(status, old, new, NUMERIC=FALSE)
##D 
## End(Not run)





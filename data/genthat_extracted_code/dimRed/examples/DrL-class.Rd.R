library(dimRed)


### Name: DrL-class
### Title: Distributed Recursive Graph Layout
### Aliases: DrL-class DrL

### ** Examples

## Not run: 
##D dat <- loadDataSet("Swiss Roll", n = 500)
##D 
##D ## use the S4 Class directly:
##D drl <- DrL()
##D emb <- drl@fun(dat, drl@stdpars)
##D 
##D ## simpler, use embed():
##D emb2 <- embed(dat, "DrL")
##D 
##D 
##D plot(emb)
## End(Not run)





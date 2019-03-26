library(multilevel)


### Name: boot.icc
### Title: Bootstrap ICC values in 2-level data
### Aliases: boot.icc
### Keywords: attribute

### ** Examples

## Not run: 
##D data(bh1996)
##D ICC.OUT<-boot.icc(bh1996$WBEING,bh1996$GRP,100)
##D quantile(ICC.OUT,c(.025,.975))
## End(Not run)




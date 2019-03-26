library(adegenet)


### Name: seppop
### Title: Separate genotypes per population
### Aliases: seppop seppop-methods seppop,ANY-method seppop,genind-method
###   seppop,genlight-method
### Keywords: manip

### ** Examples

## Not run: 
##D data(microbov)
##D strata(microbov) <- data.frame(other(microbov))
##D 
##D obj <- seppop(microbov)
##D names(obj)
##D 
##D obj$Salers
##D 
##D ### example using strata
##D obj2 <- seppop(microbov, ~coun/spe)
##D names(obj2)
##D 
##D obj2$AF_BI
##D 
##D #### example for genlight objects ####
##D x <- new("genlight", list(a=rep(1,1e3),b=rep(0,1e3),c=rep(1, 1e3)))
##D x
##D 
##D pop(x) # no population info
##D pop(x) <- c("pop1","pop2", "pop1") # set population memberships
##D pop(x)
##D seppop(x)
##D as.matrix(seppop(x)$pop1)[,1:20]
##D as.matrix(seppop(x)$pop2)[,1:20,drop=FALSE]
## End(Not run)




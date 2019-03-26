library(agridat)


### Name: mercer.mangold.uniformity
### Title: Uniformity trial of mangolds
### Aliases: mercer.mangold.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(mercer.mangold.uniformity)
##D   dat <- mercer.mangold.uniformity
##D   
##D   require(desplot)
##D   desplot(leaves~col*row, data=dat,
##D           aspect=145/302, # true aspect
##D           main="mercer.mangold.uniformity - leaves")
##D 
##D   require(desplot)
##D   desplot(roots~col*row, data=dat,
##D           aspect=145/302, # true aspect
##D           main="mercer.mangold.uniformity - roots")
##D 
##D   require(lattice)
##D   xyplot(roots~leaves, data=dat)
##D   
## End(Not run)




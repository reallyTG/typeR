library(agridat)


### Name: nonnecke.peas.uniformity
### Title: Uniformity trial of canning peas
### Aliases: nonnecke.peas.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(nonnecke.peas.uniformity)
##D   dat <- nonnecke.peas.uniformity
##D   
##D   require(desplot)
##D   desplot(vines~col*row|block, data=dat,
##D           tick=TRUE, flip=TRUE, aspect=248/90, # true aspect
##D           main="nonnecke.peas.uniformity - vines")
##D   desplot(peas~col*row|block, data=dat,
##D           tick=TRUE, flip=TRUE, aspect=248/90, # true aspect
##D           main="nonnecke.peas.uniformity - peas")
##D 
##D   require(lattice)
##D   xyplot(peas~vines|block,dat,
##D          xlab="vine weight", ylab="shelled pea weight",
##D          main="nonnecke.peas.uniformity")
##D 
## End(Not run)




library(mht)


### Name: mht.order
### Title: Multiple testing procedure for ordered variable selection
### Aliases: mht.order

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D 
##D mod.order=mht.order(x,y,ordre=5:1,alpha=c(0.1,0.05))
##D mod.order
## End(Not run)




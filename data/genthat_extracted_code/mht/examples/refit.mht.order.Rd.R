library(mht)


### Name: refit.mht.order
### Title: Refit a 'mht.order' object
### Aliases: refit.mht.order

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D ynew=x%*%beta+rnorm(100)
##D 
##D # mht.order
##D mod.order=mht.order(x,y)
##D 
##D # refit mht.order on a new vector of observation
##D mod.refit=refit(mod.order,ynew)
## End(Not run)




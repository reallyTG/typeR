library(mht)


### Name: refit.mht
### Title: Refit a 'mht' object
### Aliases: refit refit.mht

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D ynew=x%*%beta+rnorm(100)
##D 
##D # mht
##D mod=mht(x,y,alpha=c(0.1,0.05),maxordre=15)
##D 
##D # refit mht on a new vector of observation
##D mod2=refit(mod,ynew,maxordre=15)
## End(Not run)




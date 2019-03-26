library(mht)


### Name: plot
### Title: graphical output for a 'mht' or 'mht.order' object
### Aliases: plot.mht.order plot.mht

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D 
##D # mht
##D mod=mht(x,y,alpha=c(0.1,0.05),maxordre=15)
##D plot(mod)
##D 
##D # mht.order
##D mod.order=mht.order(x,y,ordre=5:1,alpha=c(0.1,0.05))
##D plot(mod.order)
## End(Not run)




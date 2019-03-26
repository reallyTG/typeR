library(mht)


### Name: plot.bolasso
### Title: graphical output for a 'bolasso' object
### Aliases: plot.bolasso

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D 
##D # BoLasso
##D mod=bolasso(x,y,mu=seq(1.5,0.1,-0.1))
##D plot(mod)
## End(Not run)




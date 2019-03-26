library(mht)


### Name: bolasso
### Title: Bolasso: Bootstrapped Lasso
### Aliases: bolasso

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(1,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D 
##D mod=bolasso(x,y,mu=seq(1.5,0.1,-0.1))
##D mod
## End(Not run)




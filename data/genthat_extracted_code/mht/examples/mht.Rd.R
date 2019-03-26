library(mht)


### Name: mht
### Title: Multiple testing procedure for non-ordered variable selection
### Aliases: mht

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D 
##D mod=mht(x,y,alpha=c(0.1,0.05),maxordre=15)
##D mod
## End(Not run)




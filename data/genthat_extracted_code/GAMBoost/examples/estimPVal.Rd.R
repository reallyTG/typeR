library(GAMBoost)


### Name: estimPVal
### Title: Estimate p-values for a model fitted by GAMBoost or GLMBoost
### Aliases: estimPVal
### Keywords: models regression survial

### ** Examples

## Not run: 
##D ##  Generate some data 
##D x <- matrix(runif(100*8,min=-1,max=1),100,8)             
##D eta <- -0.5 + 2*x[,1] + 4*x[,3]
##D y <- rbinom(100,1,binomial()$linkinv(eta))
##D 
##D ##  Fit a model with only linear components
##D gb1 <- GLMBoost(x,y,penalty=100,stepno=100,trace=TRUE,family=binomial(),criterion="score") 
##D 
##D #   estimate p-values
##D 
##D p1 <- estimPVal(gb1,x,y,permute.n=10)
##D 
##D #   get a second vector of estimates for checking how large
##D #   random variation is
##D 
##D p2 <- estimPVal(gb1,x,y,permute.n=10)
##D 
##D plot(p1,p2,xlim=c(0,1),ylim=c(0,1),xlab="permute 1",ylab="permute 2")
## End(Not run)





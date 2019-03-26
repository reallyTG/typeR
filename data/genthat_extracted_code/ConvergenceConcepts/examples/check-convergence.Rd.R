library(ConvergenceConcepts)


### Name: check.convergence
### Title: Check convergence
### Aliases: check.convergence
### Keywords: dplot iplot distribution htest

### ** Examples


## Not run: 
##D 
##D ####################### Exercise 3 ##############################
##D # Let X1, X2, ..., Xn be independent random variables such that #
##D # P[Xn=sqrt(n)]=1/n and P[Xn=0]=1-1/n                           #
##D # Does Xn converges to 0 in 2-th mean? in probability?          #
##D #################################################################
##D 
##D        options(example.ask=FALSE)
##D 
##D        pnotrgen<-function(n){rbinom(n,1,1/(1:n))*sqrt(1:n)}
##D 
##D        check.convergence(nmax=1000,M=500,genXn=pnotrgen,mode="r",r=2)
##D        legend(100,6,legend=expression(hat(e)["n,2"]),lty=1)
##D        tt3.1 <<- check.convergence(nmax=1000,M=500,genXn=pnotrgen,mode="p")
##D 
## End(Not run)





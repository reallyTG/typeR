library(sparsereg)


### Name: summary.sparsereg
### Title: Summaries for a sparse regression.
### Aliases: summary.sparsereg

### ** Examples


## Not run: 
##D  set.seed(1)
##D  n<-500
##D  k<-100
##D  Sigma<-diag(k)
##D  Sigma[Sigma==0]<-.5
##D  X<-mvrnorm(n,mu=rep(0,k),Sigma=Sigma)
##D  y.true<-3+X[,2]*2+X[,3]*(-3)
##D  y<-y.true+rnorm(n)
##D 
##D 
##D 
##D ##Fit a linear model with five covariates.
##D  s1<-sparsereg(y,X[,1:5])
##D  summary(s1)
## End(Not run)





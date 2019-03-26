library(sparsereg)


### Name: sparsereg
### Title: Sparse regression for experimental and observational data.
### Aliases: sparsereg

### ** Examples


## Not run: 
##D  set.seed(1)
##D  n<-500
##D  k<-5
##D  treat<-sample(c("a","b","c"),n,replace=TRUE,pr=c(.5,.25,.25))
##D  treat2<-sample(c("a","b","c","d"),n,replace=TRUE,pr=c(.25,.25,.25,.25))
##D  Sigma<-diag(k)
##D  Sigma[Sigma==0]<-.5
##D  X<-mvrnorm(n,m=rep(0,k),S=Sigma)
##D  y.true<-3+X[,2]*2+(treat=="a")*2 +(treat=="b")*(-2)+X[,2]*(treat=="b")*(-2)+
##D   X[,2]*(treat2=="c")*2
##D  y<-y.true+rnorm(n,sd=2)
##D 
##D ##Fit a linear model.
##D s1<-sparsereg(y, X, cbind(treat,treat2), scale.type="TX")
##D s1.EM<-sparsereg(y, X, cbind(treat,treat2), EM=TRUE, scale.type="TX")
##D 
##D ##Summarize results from MCMC fit
##D summary(s1)
##D plot(s1)
##D violinplot(s1)
##D 
##D ##Summarize results from MCMC fit
##D summary(s1.EM)
##D plot(s1.EM)
##D 
##D ##Extension using a baseline category
##D s1.base<-sparsereg(y, X, treat, scale.type="TX", baseline.vec="a")
##D 
##D summary(s1.base)
##D plot(s1.base)
##D violinplot(s1.base)
##D 
## End(Not run)





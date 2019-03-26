library(SparseFactorAnalysis)


### Name: sfa
### Title: Sparse factor analysis for mixed binary and count data.
### Aliases: sfa

### ** Examples


## Not run: 
##D ##Sample size and dimensions.
##D  set.seed(1)
##D  n.sim<-50
##D  k.sim<-500
##D  
##D ##True vector of dimension weights.
##D  d.sim<-rep(0,n.sim)
##D  d.sim[1:3]<-c(2, 1.5, 1)*3
##D 
##D ##Formulate true latent dimensions.
##D  U.sim<-matrix(rnorm(n.sim^2,sd=.5), nr=n.sim, nc=n.sim)
##D  V.sim<-matrix(rnorm(n.sim*k.sim,sd=.5), nr=k.sim, nc=n.sim)
##D  Theta.sim<-U.sim%*%diag(d.sim)%*%t(V.sim)
##D 
##D ##Generate binary outcome and count data.
##D  probs.sim<-pnorm((-1+Theta.sim+rep(1,n.sim)%*%t(rnorm(k.sim,sd=.5)) + 
##D    rnorm(n.sim,sd=.5)%*%t(rep(1,k.sim))   ))
##D  votes.mat<- 
##D     apply(probs.sim[1:25,],c(1,2),FUN=function(x) rbinom(1,1,x))
##D  count.mat<- 
##D     apply(probs.sim[26:50, ],c(1,2),FUN=function(x) rpois(1,20*x))
##D  M<-rbind(votes.mat,count.mat)
##D  
##D ## Run sfa
##D  sparse1<-sfa(M, maxdim=10)
##D  
##D ##Analyze results.
##D  summary(sparse1)
##D  plot(sparse1,type="dim")
##D  plot(sparse1,type="scatter")
##D 
##D ##Compare to true data generating process
##D 
##D plot(sparse1$Z,Theta.sim)
##D abline(c(0,1))
##D 
## End(Not run)





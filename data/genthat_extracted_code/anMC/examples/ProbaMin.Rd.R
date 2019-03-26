library(anMC)


### Name: ProbaMin
### Title: Probability of exceedance of minimum of Gaussian vector
### Aliases: ProbaMin

### ** Examples

## Not run: 
##D # Compute probability P(X \in [0,\infty]) with X~N(0,Sigma)
##D d<-200     # example dimension
##D mu<-rep(0,d)    # mean of the normal vector
##D # correlation structure (Miwa et al. 2003, Craig 2008, Botev 2016)
##D Sigma<-0.5*diag(d)+ 0.5*rep(1,d)%*%t(rep(1,d))
##D pANMC<-ProbaMin(cBdg=20, q=min(50,d/2), E=seq(0,1,,d), threshold=0, mu=mu, Sigma=Sigma,
##D  pn = NULL, lightReturn = TRUE, method = 3, verb = 2, Algo = "ANMC")
##D proba<-1-pANMC$probability
##D 
##D # Percentage error
##D abs(1-pANMC$probability-1/(d+1))/(1/(d+1))
##D 
##D 
##D # Implement ProbaMin with user defined function for active dimension probability estimate
##D if(!requireNamespace("TruncatedNormal", quietly = TRUE)) {
##D stop("TruncatedNormal needed for this example to work. Please install it.",
##D      call. = FALSE)
##D }
##D # define pmvnorm_usr with the function mvNcdf from the package TruncatedNormal
##D pmvnorm_usr<-function(lower,upper,mean,sigma){
##D     pMET<-TruncatedNormal::mvNcdf(l = lower-mean,u = upper-mean,Sig = sigma,n = 5e4)
##D     res<-pMET$prob
##D     attr(res,"error")<-pMET$relErr
##D     return(res)
##D }
##D pANMC<-ProbaMin(cBdg=20, q=min(50,d/2), E=seq(0,1,,d), threshold=0, mu=mu, Sigma=Sigma,
##D  pn = NULL, lightReturn = TRUE, method = 3, verb = 2, Algo = "ANMC",pmvnorm_usr=pmvnorm_usr)
##D proba<-1-pANMC$probability
##D 
##D # Percentage error
##D abs(1-pANMC$probability-1/(d+1))/(1/(d+1))
##D 
##D # Implement ProbaMax with user defined function for truncated normal sampling
##D 
##D if(!requireNamespace("tmg", quietly = TRUE)) {
##D stop("Package tmg needed for this example to work. Please install it.",
##D      call. = FALSE)
##D }
##D trmvrnorm_usr<-function(n,mu,sigma,upper,lower,verb){
##D  M<-chol2inv(chol(sigma))
##D  r=as.vector(M%*%mu)
##D 
##D  if(all(lower==-Inf) && all(upper==Inf)){
##D    f<- NULL
##D    g<- NULL
##D  }else{
##D    if(all(lower==-Inf)){
##D      f<--diag(length(mu))
##D      g<-upper
##D      initial<-(upper-1)/2
##D    }else if(all(upper==Inf)){
##D      f<-diag(length(mu))
##D      g<- -lower
##D      initial<-2*(lower+1)
##D    }else{
##D      f<-rbind(-diag(length(mu)),diag(length(mu)))
##D      g<-c(upper,-lower)
##D      initial<-(upper-lower)/2
##D    }
##D  }
##D  reals_tmg<-tmg::rtmg(n=n,M=M,r=r,initial = initial,f=f,g=g)
##D 
##D  return(t(reals_tmg))
##D }
##D 
##D pANMC<-ProbaMin(cBdg=20, q=min(50,d/2), E=seq(0,1,,d), threshold=0, mu=mu, Sigma=Sigma,
##D  pn = NULL, lightReturn = TRUE, method = 3, verb = 2, Algo = "ANMC",trmvrnorm=trmvrnorm_usr)
##D proba<-1-pANMC$probability
##D 
##D # Percentage error
##D abs(1-pANMC$probability-1/(d+1))/(1/(d+1))
## End(Not run)




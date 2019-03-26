library(NPMLEcmprsk)


### Name: NPMLEcmprsk
### Title: Type-Specific Failure Rate and Hazard Rate on Competing Risks
###   Data
### Aliases: NPMLEcmprsk

### ** Examples

## Not run: 
##D # setting the seed
##D set.seed(1)
##D 
##D # setting the sample size
##D N<-500
##D 
##D # setting the real parameters
##D alpha<-c(-2,5)
##D beta<-c(0.5,-0.5)
##D Lambda<-1/c(4,5)
##D Z<-rnorm(N,0,1)
##D 
##D # generating the data
##D W<-c((exp(cbind(1,Z) ##D 
##D T<--log(matrix(runif(2*N),2,N))/Lambda*exp(-t(cbind(Z,Z))*beta)
##D survival.time<-sapply(1:N,function(i) T[W[i],i])
##D 
##D censoring.time<-runif(N,0.1,10)
##D 
##D temp<-survival.time<=censoring.time
##D X<-sapply(1:N,function(i) if(temp[i]) survival.time[i] else censoring.time[i])
##D delta<-sapply(1:N,function(i) if(temp[i]) W[i] else 0)
##D 
##D # estimating the parameters
##D data<-cbind(X,delta,Z)
##D result<-NPMLEcmprsk(data)
##D result
##D 
##D # plot probability of type-specific failures
##D logistic<-function(coef.alpha,covariates)
##D exp(cbind(1,covariates) ##D 
##D 
##D range<-seq(min(Z),max(Z),0.1)
##D 
##D plot(range,logistic(result$coef.alpha,range),type="l"
##D ,xlab="covariate",ylab="Case fatality rate")
##D lines(range,logistic(result$coef.alpha.95.lower.CI,range),lty=2)
##D lines(range,logistic(result$coef.alpha.95.upper.CI,range),lty=2)
##D 
##D points(Z,logistic(result$coef.alpha,Z),cex=0.7)
## End(Not run)




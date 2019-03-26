library(STAR)


### Name: dinvgauss
### Title: The Inverse Gaussian Distribution
### Aliases: dinvgauss qinvgauss pinvgauss rinvgauss
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## Start with the inverse Gauss
##D ## Define standard mu and sigma
##D mu.true <- 0.075 ## a mean ISI of 75 ms
##D sigma2.true <- 3
##D ## Define a sequence of points on the time axis
##D X <- seq(0.001,0.3,0.001)
##D ## look at the density
##D plot(X,dinvgauss(X,mu.true,sigma2.true),type="l",xlab="ISI (s)",ylab="Density")
##D 
##D ## Generate a sample of 100 ISI from this distribution
##D sampleSize <- 100
##D sampIG <- rinvgauss(sampleSize,mu=mu.true,sigma2=sigma2.true)
##D ## check out the empirical survival function (obtained with the Kaplan-Meyer
##D ## estimator) against the true one
##D library(survival)
##D sampIG.KMfit <- survfit(Surv(sampIG,1+numeric(length(sampIG))) ~1)
##D plot(sampIG.KMfit,log=TRUE)
##D lines(X,pinvgauss(X,mu.true,sigma2.true,lower.tail=FALSE),col=2)
##D 
##D ## Get a ML fit
##D sampIGmleIG <- invgaussMLE(sampIG)
##D ## compare true and estimated parameters
##D rbind(est = sampIGmleIG$estimate,se = sampIGmleIG$se,true = c(mu.true,sigma2.true))
##D ## plot contours of the log relative likelihood function
##D Mu <- seq(sampIGmleIG$estimate[1]-3*sampIGmleIG$se[1],
##D           sampIGmleIG$estimate[1]+3*sampIGmleIG$se[1],
##D           sampIGmleIG$se[1]/10)
##D Sigma2 <- seq(sampIGmleIG$estimate[2]-7*sampIGmleIG$se[2],
##D               sampIGmleIG$estimate[2]+7*sampIGmleIG$se[2],
##D               sampIGmleIG$se[2]/10)
##D sampIGmleIGcontour <- sapply(Mu, function(mu) sapply(Sigma2, function(s2) sampIGmleIG$r(mu,s2))) 
##D contour(Mu,Sigma2,t(sampIGmleIGcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels=c("log(0.5)",
##D           "log(0.1)",
##D           "-1/2*P(Chi2=0.95)",
##D           "-1/2*P(Chi2=0.99)"),
##D         xlab=expression(mu),ylab=expression(sigma^2))
##D points(mu.true,sigma2.true,pch=16,col=2)
##D ## We can see that the contours are more parabola like on a log scale
##D contour(log(Mu),log(Sigma2),t(sampIGmleIGcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels=c("log(0.5)",
##D           "log(0.1)",
##D           "-1/2*P(Chi2=0.95)",
##D           "-1/2*P(Chi2=0.99)"),
##D         xlab=expression(log(mu)),ylab=expression(log(sigma^2)))
##D points(log(mu.true),log(sigma2.true),pch=16,col=2)
##D ## make a deviance test for the true parameters
##D pchisq(-2*sampIGmleIG$r(mu.true,sigma2.true),df=2)
##D ## check fit with a QQ plot
##D qqDuration(sampIGmleIG,log="xy")
##D 
##D ## Generate a censored sample using an exponential distribution
##D sampEXP <- rexp(sampleSize,1/(2*mu.true))
##D sampIGtime <- pmin(sampIG,sampEXP)
##D sampIGstatus <- as.numeric(sampIG <= sampEXP)
##D ## fit the censored sample
##D sampIG2mleIG <- invgaussMLE(sampIGtime,,sampIGstatus)
##D ## look at the results
##D rbind(est = sampIG2mleIG$estimate,
##D       se = sampIG2mleIG$se,
##D       true = c(mu.true,sigma2.true))
##D pchisq(-2*sampIG2mleIG$r(mu.true,sigma2.true),df=2)
##D ## repeat the survival function estimation
##D sampIG2.KMfit <- survfit(Surv(sampIGtime,sampIGstatus) ~1)
##D plot(sampIG2.KMfit,log=TRUE)
##D lines(X,pinvgauss(X,sampIG2mleIG$estimate[1],sampIG2mleIG$estimate[2],lower.tail=FALSE),col=2)
## End(Not run)




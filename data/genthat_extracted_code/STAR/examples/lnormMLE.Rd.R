library(STAR)


### Name: lnormMLE
### Title: Maximum Likelihood Parameter Estimation of a Log Normal Model
###   with Possibly Censored Data
### Aliases: lnormMLE
### Keywords: distribution ts

### ** Examples

## Simulate sample of size 100 from a log normal
## distribution
set.seed(1102006,"Mersenne-Twister")
sampleSize <- 100
meanlog.true <- -2.4
sdlog.true <- 0.4
sampLN <- rlnorm(sampleSize,meanlog.true,sdlog.true)
sampLNmleLN <- lnormMLE(sampLN)
rbind(est = sampLNmleLN$estimate,se = sampLNmleLN$se,true = c(meanlog.true,sdlog.true))
## In the absence of censoring the MLE of the log normal is available in a
## closed form together with its variance (ie, the observed information matrix)
## we can check that we did not screw up at that stage by comparing the observed
## information matrix obtained numerically with the analytical one. To do that we
## use the MINUS log likelihood function returned by lnormMLE to get a numerical
## estimate
detailedFit <- optim(fn=sampLNmleLN$mll,
                     par=as.vector(c(sampLNmleLN$estimate[1],log(sampLNmleLN$estimate[2]))),
                     method="BFGS",
                     hessian=TRUE)
## We should not forget that the "mll" function uses the log of the sdlog parameter while
## the "se" component of sampLNmleLN list is expressed on the linear scale we must therefore
## transform one into the other as follows (Kalbfleisch, 1985, p71):
## if x = u and y = exp(v) and if we have the information matrix in term of
## u and v (that's the hessian component of list detailedFit above), we create matrix:
##      du/dx du/dy
## Q =
##      dv/dx dv/dy
## and we get I in term of x and y by the following matrix product:
## I(x,y) <- t(Q) %*% I(u,v) %*% Q
## In the present case:
##  du/dx = 1, du/dy = 0, dv/dx = 0, dv/dy = 1/exp(v)
## Therefore:
Q <- diag(c(1,1/exp(detailedFit$par[2])))
numericalI <- t(Q) %*% detailedFit$hessian %*% Q
seComp <- rbind(sampLNmleLN$se, sqrt(diag(solve(numericalI))))
colnames(seComp) <- c("meanlog","sdlog")
rownames(seComp) <- c("analytical", "numerical")
seComp
## We can check the relative differences between the 2
apply(seComp,2,function(x) abs(diff(x))/x[1])

## Not run: 
##D ## Estimate the log relative likelihood on a grid to plot contours
##D MeanLog <- seq(sampLNmleLN$estimate[1]-4*sampLNmleLN$se[1],
##D                sampLNmleLN$estimate[1]+4*sampLNmleLN$se[1],
##D                sampLNmleLN$se[1]/10)
##D SdLog <- seq(sampLNmleLN$estimate[2]-4*sampLNmleLN$se[2],
##D              sampLNmleLN$estimate[2]+4*sampLNmleLN$se[2],
##D              sampLNmleLN$se[2]/10)
##D sampLNmleLNcontour <- sapply(MeanLog, function(mu) sapply(SdLog, function(s) sampLNmleLN$r(mu,s)))
##D ## plot contours using a linear scale for the parameters
##D ## draw four contours corresponding to the following likelihood ratios:
##D ##  0.5, 0.1, Chi2 with 2 df and p values of 0.95 and 0.99
##D X11(width=12,height=6)
##D layout(matrix(1:2,ncol=2))
##D contour(MeanLog,SdLog,t(sampLNmleLNcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels=c("log(0.5)",
##D           "log(0.1)",
##D           "-1/2*P(Chi2=0.95)",
##D           "-1/2*P(Chi2=0.99)"),
##D         xlab=expression(mu),ylab=expression(sigma),
##D         main="Log Relative Likelihood Contours"
##D         )
##D points(sampLNmleLN$estimate[1],sampLNmleLN$estimate[2],pch=3)
##D points(meanlog.true,sdlog.true,pch=16,col=2)
##D ## The contours are not really symmetrical about the MLE we can try to
##D ## replot them using a log scale for the parameters to see if that improves
##D ## the situation
##D contour(MeanLog,log(SdLog),t(sampLNmleLNcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels="",
##D         xlab=expression(mu),ylab=expression(log(sigma)),
##D         main="Log Relative Likelihood Contours",
##D         sub=expression(paste("log scale for parameter: ",sigma)))
##D points(sampLNmleLN$estimate[1],log(sampLNmleLN$estimate[2]),pch=3)
##D points(meanlog.true,log(sdlog.true),pch=16,col=2)
##D 
##D ## make a parametric boostrap to check the distribution of the deviance
##D nbReplicate <- 10000
##D sampleSize <- 100
##D system.time(
##D             devianceLN100 <- replicate(nbReplicate,{
##D                              sampLN <- rlnorm(sampleSize,meanlog=meanlog.true,sdlog=sdlog.true)
##D                              sampLNmleLN <- lnormMLE(sampLN)
##D                              -2*sampLNmleLN$r(meanlog.true,sdlog.true)
##D                            }
##D                                        )
##D             )[3]
##D 
##D ## Get 95 and 99% confidence intervals for the QQ plot
##D ci <- sapply(1:nbReplicate,
##D                  function(idx) qchisq(qbeta(c(0.005,0.025,0.975,0.995),
##D                                             idx,
##D                                             nbReplicate-idx+1),
##D                                       df=2)
##D              )
##D ## make QQ plot
##D X <- qchisq(ppoints(nbReplicate),df=2)
##D Y <- sort(devianceLN100)
##D X11()
##D plot(X,Y,type="n",
##D      xlab=expression(paste(chi[2]^2," quantiles")),
##D      ylab="MC quantiles",
##D      main="Deviance with true parameters after ML fit of logNorm data",
##D      sub=paste("sample size:", sampleSize,"MC replicates:", nbReplicate)
##D      )
##D abline(a=0,b=1)
##D lines(X,ci[1,],lty=2)
##D lines(X,ci[2,],lty=2)
##D lines(X,ci[3,],lty=2)
##D lines(X,ci[4,],lty=2)
##D lines(X,Y,col=2)
## End(Not run)




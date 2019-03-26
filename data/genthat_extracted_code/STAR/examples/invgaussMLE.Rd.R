library(STAR)


### Name: invgaussMLE
### Title: Maximum Likelihood Parameter Estimation of an Inverse Gaussian
###   Model with Possibly Censored Data
### Aliases: invgaussMLE
### Keywords: distribution ts

### ** Examples

## Simulate sample of size 100 from an inverse Gaussian
## distribution
set.seed(1102006,"Mersenne-Twister")
sampleSize <- 100
mu.true <- 0.075 
sigma2.true <- 3
sampleSize <- 100
sampIG <- rinvgauss(sampleSize,mu=mu.true,sigma2=sigma2.true)
## Make a maximum likelihood fit
sampIGmleIG <- invgaussMLE(sampIG)
## Compare estimates with actual values
rbind(est = coef(sampIGmleIG),se = sampIGmleIG$se,true = c(mu.true,sigma2.true))
## In the absence of censoring the MLE of the inverse Gaussian is available in a
## closed form together with its variance (ie, the observed information matrix)
## we can check that we did not screw up at that stage by comparing the observed
## information matrix obtained numerically with the analytical one. To do that we
## use the MINUS log likelihood function returned by invgaussMLE to get a numerical
## estimate
detailedFit <- optim(par=as.vector(log(sampIGmleIG$estimate)),
                     fn=sampIGmleIG$mll,
                     method="BFGS",
                     hessian=TRUE)
## We should not forget that the "mll" function uses the log of the parameters while
## the "se" component of sampIGmleIG list is expressed on the linear scale we must therefore
## transform one into the other as follows (Kalbfleisch, 1985, p71):
## if x = exp(u) and y = exp(v) and if we have the information matrix in term of
## u and v (that's the hessian component of list detailedFit above), we create matrix:
##      du/dx du/dy
## Q =
##      dv/dx dv/dy
## and we get I in term of x and y by the following matrix product:
## I(x,y) <- t(Q) %*% I(u,v) %*% Q
## In the present case:
##  du/dx = 1/exp(u), du/dy = 0, dv/dx = 0, dv/dy = 1/exp(v)
## Therefore:
Q <- diag(1/exp(detailedFit$par))
numericalI <- t(Q) %*% detailedFit$hessian %*% Q
seComp <- rbind(sampIGmleIG$se, sqrt(diag(solve(numericalI))))
colnames(seComp) <- c("mu","sigma2")
rownames(seComp) <- c("analytical", "numerical")
seComp
## We can check the relative differences between the 2
apply(seComp,2,function(x) abs(diff(x))/x[1])

## Not run: 
##D ## Estimate the log relative likelihood on a grid to plot contours
##D Mu <- seq(coef(sampIGmleIG)[1]-4*sampIGmleIG$se[1],
##D           coef(sampIGmleIG)[1]+4*sampIGmleIG$se[1],
##D           sampIGmleIG$se[1]/10)
##D Sigma2 <- seq(coef(sampIGmleIG)[2]-4*sampIGmleIG$se[2],
##D               coef(sampIGmleIG)[2]+4*sampIGmleIG$se[2],
##D               sampIGmleIG$se[2]/10)
##D sampIGmleIGcontour <- sapply(Mu, function(mu) sapply(Sigma2, function(s2) sampIGmleIG$r(mu,s2)))
##D ## plot contours using a linear scale for the parameters
##D ## draw four contours corresponding to the following likelihood ratios:
##D ##  0.5, 0.1, Chi2 with 2 df and p values of 0.95 and 0.99
##D X11(width=12,height=6)
##D layout(matrix(1:2,ncol=2))
##D contour(Mu,Sigma2,t(sampIGmleIGcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels=c("log(0.5)",
##D           "log(0.1)",
##D           "-1/2*P(Chi2=0.95)",
##D           "-1/2*P(Chi2=0.99)"),
##D         xlab=expression(mu),ylab=expression(sigma^2),
##D         main="Log Relative Likelihood Contours"
##D         )
##D points(coef(sampIGmleIG)[1],coef(sampIGmleIG)[2],pch=3)
##D points(mu.true,sigma2.true,pch=16,col=2)
##D ## The contours are not really symmetrical about the MLE we can try to
##D ## replot them using a log scale for the parameters to see if that improves
##D ## the situation
##D contour(log(Mu),log(Sigma2),t(sampIGmleIGcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels="",
##D         xlab=expression(log(mu)),ylab=expression(log(sigma^2)),
##D         main="Log Relative Likelihood Contours",
##D         sub="log scale for the parameters")
##D points(log(coef(sampIGmleIG)[1]),log(coef(sampIGmleIG)[2]),pch=3)
##D points(log(mu.true),log(sigma2.true),pch=16,col=2)
##D 
##D ## Even with the log scale the contours are not ellipsoidal, so let us compute profiles
##D ## For that we are going to use the returned MINUS log likelihood function
##D logMuProfFct <- function(logMu,...) {
##D   myOpt <- optimise(function(x) sampIGmleIG$mll(c(logMu,x))+logLik(sampIGmleIG),...)
##D   as.vector(unlist(myOpt[c("objective","minimum")]))
##D }
##D logMuProfCI <- function(logMu,
##D                         CI,
##D                         a=logS2Seq[1],
##D                         b=logS2Seq[length(logS2Seq)]) logMuProfFct(logMu,c(a,b))[1] - qchisq(CI,1)/2
##D 
##D logS2ProfFct <- function(logS2,...) {
##D   myOpt <- optimise(function(x) sampIGmleIG$mll(c(x,logS2))+logLik(sampIGmleIG),...)
##D   as.vector(unlist(myOpt[c("objective","minimum")]))
##D }
##D logS2ProfCI <- function(logS2, CI,
##D                         a=logMuSeq[1],
##D                         b=logMuSeq[length(logMuSeq)]) logS2ProfFct(logS2,c(a,b))[1] - qchisq(CI,1)/2
##D 
##D 
##D ## We compute profiles (on the log scale) eploxing +/- 3 times
##D ## the se about the MLE
##D logMuSE <- sqrt(diag(solve(detailedFit$hessian)))[1]
##D logMuSeq <- seq(log(coef(sampIGmleIG)[1])-3*logMuSE,
##D                 log(coef(sampIGmleIG)[1])+3*logMuSE,
##D                 logMuSE/10)
##D logS2SE <- sqrt(diag(solve(detailedFit$hessian)))[2]
##D logS2Seq <- seq(log(coef(sampIGmleIG)[2])-3*logS2SE,
##D                 log(coef(sampIGmleIG)[2])+3*logS2SE,
##D                 logS2SE/10)
##D logMuProf <- sapply(logMuSeq,logMuProfFct,
##D                     lower=logS2Seq[1],
##D                     upper=logS2Seq[length(logS2Seq)])
##D ## Get 95##D 
##D logMuCI95 <- c(uniroot(logMuProfCI,
##D                        interval=c(logMuSeq[1],log(coef(sampIGmleIG)[1])),
##D                        CI=0.95)$root,
##D                uniroot(logMuProfCI,
##D                        interval=c(log(coef(sampIGmleIG)[1]),logMuSeq[length(logMuSeq)]),
##D                        CI=0.95)$root
##D                )
##D logMuCI99 <- c(uniroot(logMuProfCI,
##D                        interval=c(logMuSeq[1],log(coef(sampIGmleIG)[1])),
##D                        CI=0.99)$root,
##D                uniroot(logMuProfCI,
##D                        interval=c(log(coef(sampIGmleIG)[1]),logMuSeq[length(logMuSeq)]),
##D                        CI=0.99)$root
##D                )
##D 
##D logS2Prof <- sapply(logS2Seq,logS2ProfFct,
##D                     lower=logMuSeq[1],
##D                     upper=logMuSeq[length(logMuSeq)])
##D ## Get 95##D 
##D logS2CI95 <- c(uniroot(logS2ProfCI,
##D                        interval=c(logS2Seq[1],log(coef(sampIGmleIG)[2])),
##D                        CI=0.95)$root,
##D                uniroot(logS2ProfCI,
##D                        interval=c(log(coef(sampIGmleIG)[2]),logS2Seq[length(logS2Seq)]),
##D                        CI=0.95)$root
##D                )
##D logS2CI99 <- c(uniroot(logS2ProfCI,
##D                        interval=c(logS2Seq[1],log(coef(sampIGmleIG)[2])),
##D                        CI=0.99)$root,
##D                uniroot(logS2ProfCI,
##D                        interval=c(log(coef(sampIGmleIG)[2]),logS2Seq[length(logS2Seq)]),
##D                        CI=0.99)$root
##D                )
##D 
##D 
##D ## Add profiles to the previous plot
##D lines(logMuSeq,logMuProf[2,],col=2,lty=2)
##D lines(logS2Prof[2,],logS2Seq,col=2,lty=2)
##D 
##D ## We can now check the deviations of the (profiled) deviances
##D ## from the asymptotic parabolic curves
##D X11()
##D layout(matrix(1:4,nrow=2))
##D oldpar <- par(mar=c(4,4,2,1))
##D logMuSeqOffset <- logMuSeq-log(coef(sampIGmleIG)[1])
##D logMuVar <- diag(solve(detailedFit$hessian))[1]
##D plot(logMuSeq,2*logMuProf[1,],type="l",xlab=expression(log(mu)),ylab="Deviance")
##D lines(logMuSeq,logMuSeqOffset^2/logMuVar,col=2)
##D points(log(coef(sampIGmleIG)[1]),0,pch=3)
##D abline(h=0)
##D abline(h=qchisq(0.95,1),lty=2)
##D abline(h=qchisq(0.99,1),lty=2)
##D lines(rep(logMuCI95[1],2),c(0,qchisq(0.95,1)),lty=2)
##D lines(rep(logMuCI95[2],2),c(0,qchisq(0.95,1)),lty=2)
##D lines(rep(logMuCI99[1],2),c(0,qchisq(0.99,1)),lty=2)
##D lines(rep(logMuCI99[2],2),c(0,qchisq(0.99,1)),lty=2)
##D ## We can also "linearize" this last graph
##D plot(logMuSeq,
##D      sqrt(2*logMuProf[1,])*sign(logMuSeqOffset),
##D      type="l",
##D      xlab=expression(log(mu)),
##D      ylab=expression(paste("signed ",sqrt(Deviance)))
##D      )
##D lines(logMuSeq,
##D       sqrt(logMuSeqOffset^2/logMuVar)*sign(logMuSeqOffset),
##D       col=2)
##D points(log(coef(sampIGmleIG)[1]),0,pch=3)
##D 
##D logS2SeqOffset <- logS2Seq-log(coef(sampIGmleIG)[2])
##D logS2Var <- diag(solve(detailedFit$hessian))[2]
##D plot(logS2Seq,2*logS2Prof[1,],type="l",xlab=expression(log(sigma^2)),ylab="Deviance")
##D lines(logS2Seq,logS2SeqOffset^2/logS2Var,col=2)
##D points(log(coef(sampIGmleIG)[2]),0,pch=3)
##D abline(h=0)
##D abline(h=qchisq(0.95,1),lty=2)
##D abline(h=qchisq(0.99,1),lty=2)
##D lines(rep(logS2CI95[1],2),c(0,qchisq(0.95,1)),lty=2)
##D lines(rep(logS2CI95[2],2),c(0,qchisq(0.95,1)),lty=2)
##D lines(rep(logS2CI99[1],2),c(0,qchisq(0.99,1)),lty=2)
##D lines(rep(logS2CI99[2],2),c(0,qchisq(0.99,1)),lty=2)
##D ## We can also "linearize" this last graph
##D plot(logS2Seq,
##D      sqrt(2*logS2Prof[1,])*sign(logS2SeqOffset),
##D      type="l",
##D      xlab=expression(log(sigma^2)),
##D      ylab=expression(paste("signed ",sqrt(Deviance)))
##D      )
##D lines(logS2Seq,
##D       sqrt(logS2SeqOffset^2/logS2Var)*sign(logS2SeqOffset),
##D       col=2)
##D points(log(coef(sampIGmleIG)[2]),0,pch=3)
##D par(oldpar)
##D 
##D ## make a parametric boostrap to check the distribution of the deviance
##D nbReplicate <- 1000 #10000
##D sampleSize <- 100
##D system.time(
##D devianceIG100 <- lapply(1:nbReplicate,
##D                         function(idx) {
##D                           if ((idx ##D 
##D                           sampIG <- rinvgauss(sampleSize,mu=mu.true,sigma2=sigma2.true)
##D                           sampIGmleIG <- invgaussMLE(sampIG)
##D                           Deviance <- -2*sampIGmleIG$r(mu.true,sigma2.true)
##D                           logPara <- log(coef(sampIGmleIG))
##D                           logParaSE <- sampIGmleIG$se/coef(sampIGmleIG)
##D                           intervalMu <- function(n) c(-n,n)*logParaSE[1]+logPara[1]
##D                           intervalS2 <- function(n) c(-n,n)*logParaSE[2]+logPara[2]
##D                           logMuProfFct <- function(logMu,...) {
##D                             optimise(function(x)
##D                                      sampIGmleIG$mll(c(logMu,x))+logLik(sampIGmleIG),...)$objective
##D                           }
##D                           logMuProfCI <- function(logMu,
##D                                                   CI,
##D                                                   a=intervalS2(4)[1],
##D                                                   b=intervalS2(4)[2])
##D                             logMuProfFct(logMu,c(a,b)) - qchisq(CI,1)/2
##D                           
##D                           logS2ProfFct <- function(logS2,...) {
##D                             optimise(function(x)
##D                                      sampIGmleIG$mll(c(x,logS2))+logLik(sampIGmleIG),...)$objective
##D                           }
##D                           logS2ProfCI <- function(logS2, CI,
##D                                                   a=intervalMu(4)[1],
##D                                                   b=intervalMu(4)[2])
##D                             logS2ProfFct(logS2,c(a,b)) - qchisq(CI,1)/2
##D                           
##D                           factor <- 4
##D                           while((logMuProfCI(intervalMu(factor)[2],0.99) *
##D                                  logMuProfCI(logPara[1],0.99) >= 0) ||
##D                                 (logMuProfCI(intervalMu(factor)[1],0.99) *
##D                                  logMuProfCI(logPara[1],0.99) >= 0)
##D                                 ) factor <- factor+1
##D                           ##browser()
##D                           logMuCI95 <- c(uniroot(logMuProfCI,
##D                                                  interval=c(intervalMu(factor)[1],logPara[1]),
##D                                                  CI=0.95)$root,
##D                                          uniroot(logMuProfCI,
##D                                                  interval=c(logPara[1],intervalMu(factor)[2]),
##D                                                  CI=0.95)$root
##D                                          )
##D                           logMuCI99 <- c(uniroot(logMuProfCI,
##D                                                  interval=c(intervalMu(factor)[1],logPara[1]),
##D                                                  CI=0.99)$root,
##D                                          uniroot(logMuProfCI,
##D                                                  interval=c(logPara[1],intervalMu(factor)[2]),
##D                                                  CI=0.99)$root
##D                                          )
##D                           factor <- 4
##D                           while((logS2ProfCI(intervalS2(factor)[2],0.99) *
##D                                  logS2ProfCI(logPara[2],0.99) >= 0) ||
##D                                 (logS2ProfCI(intervalS2(factor)[1],0.99) *
##D                                  logS2ProfCI(logPara[2],0.99) >= 0)
##D                                 ) factor <- factor+1
##D                           logS2CI95 <- c(uniroot(logS2ProfCI,
##D                                                  interval=c(intervalS2(factor)[1],logPara[2]),
##D                                                  CI=0.95)$root,
##D                                          uniroot(logS2ProfCI,
##D                                                     interval=c(logPara[2],intervalS2(factor)[2]),
##D                                                  CI=0.95)$root
##D                                          )
##D                           logS2CI99 <- c(uniroot(logS2ProfCI,
##D                                                  interval=c(intervalS2(factor)[1],logPara[2]),
##D                                                  CI=0.99)$root,
##D                                          uniroot(logS2ProfCI,
##D                                                  interval=c(logPara[2],intervalS2(factor)[2]),
##D                                                  CI=0.99)$root
##D                                          )
##D                           list(deviance=Deviance,
##D                                logMuCI95=logMuCI95,
##D                                logMuNorm95=qnorm(c(0.025,0.975),logPara[1],logParaSE[1]),
##D                                logMuCI99=logMuCI99,
##D                                logMuNorm99=qnorm(c(0.005,0.995),logPara[1],logParaSE[1]),
##D                                logS2CI95=logS2CI95,
##D                                logS2Norm95=qnorm(c(0.025,0.975),logPara[2],logParaSE[2]),
##D                                logS2CI99=logS2CI99,
##D                                logS2Norm99=qnorm(c(0.005,0.995),logPara[2],logParaSE[2]))
##D                         }
##D                         )
##D             )[3]
##D ## Find out how many times the true parameters was within the computed CIs
##D nLogMuCI95 <- sum(sapply(devianceIG100,
##D                          function(l) l$logMuCI95[1] <= log(mu.true)  &&
##D                          log(mu.true)<= l$logMuCI95[2]
##D                          )
##D                   )
##D nLogMuNorm95 <- sum(sapply(devianceIG100,
##D                            function(l) l$logMuNorm95[1] <= log(mu.true)  &&
##D                            log(mu.true)<= l$logMuNorm95[2]
##D                            )
##D                     )
##D nLogMuCI99 <- sum(sapply(devianceIG100,
##D                          function(l) l$logMuCI99[1] <= log(mu.true)  &&
##D                          log(mu.true)<= l$logMuCI99[2]
##D                          )
##D                   )
##D nLogMuNorm99 <- sum(sapply(devianceIG100,
##D                            function(l) l$logMuNorm99[1] <= log(mu.true)  &&
##D                            log(mu.true)<= l$logMuNorm99[2]
##D                            )
##D                     )
##D ## Check if these counts are compatible with the nominal CIs
##D c(prof95Mu=nLogMuCI95,norm95Mu=nLogMuNorm95)
##D qbinom(c(0.005,0.995),nbReplicate,0.95)
##D c(prof95Mu=nLogMuCI99,norm95Mu=nLogMuNorm99)
##D qbinom(c(0.005,0.995),nbReplicate,0.99)
##D 
##D nLogS2CI95 <- sum(sapply(devianceIG100,
##D                          function(l) l$logS2CI95[1] <= log(sigma2.true)  &&
##D                          log(sigma2.true)<= l$logS2CI95[2]
##D                          )
##D                   )
##D nLogS2Norm95 <- sum(sapply(devianceIG100,
##D                            function(l) l$logS2Norm95[1] <= log(sigma2.true)  &&
##D                            log(sigma2.true)<= l$logS2Norm95[2]
##D                            )
##D                     )
##D nLogS2CI99 <- sum(sapply(devianceIG100,
##D                          function(l) l$logS2CI99[1] <= log(sigma2.true)  &&
##D                          log(sigma2.true)<= l$logS2CI99[2]
##D                          )
##D                   )
##D nLogS2Norm99 <- sum(sapply(devianceIG100,
##D                            function(l) l$logS2Norm99[1] <= log(sigma2.true)  &&
##D                            log(sigma2.true)<= l$logS2Norm99[2]
##D                            )
##D                     )
##D ## Check if these counts are compatible with the nominal CIs
##D c(prof95S2=nLogS2CI95,norm95S2=nLogS2Norm95)
##D qbinom(c(0.005,0.995),nbReplicate,0.95)
##D c(prof95S2=nLogS2CI99,norm95S2=nLogS2Norm99)
##D qbinom(c(0.005,0.995),nbReplicate,0.99)
##D 
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
##D Y <- sort(sapply(devianceIG100,function(l) l$deviance))
##D X11()
##D plot(X,Y,type="n",
##D      xlab=expression(paste(chi[2]^2," quantiles")),
##D      ylab="MC quantiles",
##D      main="Deviance with true parameters after ML fit of IG data",
##D      sub=paste("sample size:", sampleSize,"MC replicates:", nbReplicate)
##D      )
##D abline(a=0,b=1)
##D lines(X,ci[1,],lty=2)
##D lines(X,ci[2,],lty=2)
##D lines(X,ci[3,],lty=2)
##D lines(X,ci[4,],lty=2)
##D lines(X,Y,col=2)
## End(Not run)




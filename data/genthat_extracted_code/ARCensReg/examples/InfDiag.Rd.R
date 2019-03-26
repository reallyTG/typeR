library(ARCensReg)


### Name: InfDiag
### Title: Influence Diagnostic in Censored Linear Regression Model with
###   Autoregressive Errors
### Aliases: InfDiag
### Keywords: package censored regression autoregressive errors influence
###   diagnostic

### ** Examples

## Not run: 
##D #generating the data
##D set.seed(12341)
##D x = cbind(1,runif(100))
##D dat = rARCens(n=100,beta = c(1,-1),pit = c(.4,-.2),sig2=.5,
##D             x=x,cens='left',pcens=.05)
##D #creating an outlier
##D dat$data$y[40] = 5
##D plot.ts(dat$data$y)
##D 
##D #fitting the model
##D fit = ARCensReg(cc=dat$data$cc,y=dat$data$y,x,p=2,cens='left',
##D       tol=0.001,show_se=F)
##D 
##D #influence diagnostic
##D M0y = InfDiag(theta=fit$res$theta, yest=fit$yest, yyest=fit$yyest,
##D         x=x, k = 3.5, perturbation = "y")
##D M0Sigma = InfDiag(theta=fit$res$theta, yest=fit$yest, yyest=fit$yyest,
##D         x=x, k = 3.5, perturbation = "Sigma")
##D M0x = InfDiag(theta=fit$res$theta, yest=fit$yest, yyest=fit$yyest,
##D         x=x, k = 3.5, perturbation = "x",indcolx =c(0,1))
##D 
##D #perturbation on a subset of parameters
##D M0y1 = InfDiag(theta=fit$res$theta, yest=fit$yest, yyest=fit$yyest,
##D         x=x, k = 3.5, perturbation = "y",indpar=c(1,1,0,0,0))
##D M0y2 = InfDiag(theta=fit$res$theta, yest=fit$yest, yyest=fit$yyest,
##D         x=x, k = 3.5, perturbation = "y",indpar=c(0,0,1,1,1))
##D plot(M0y1,M0y2)
##D abline(v = mean(M0y1)+3.5*sd(M0y1),h = mean(M0y2)+3.5*sd(M0y2),lty=2)
## End(Not run)




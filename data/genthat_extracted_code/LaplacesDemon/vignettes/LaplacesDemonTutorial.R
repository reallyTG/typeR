### R code from vignette source 'LaplacesDemonTutorial.Stex'

###################################################
### code chunk number 1: LaplacesDemonTutorial.Stex:64-65 (eval = FALSE)
###################################################
## install.packages(pkgs="path/LaplacesDemon_ver.tar.gz", repos=NULL, type="source")


###################################################
### code chunk number 2: LaplacesDemonTutorial.Stex:72-73
###################################################
library(LaplacesDemon)


###################################################
### code chunk number 3: LaplacesDemonTutorial.Stex:80-97
###################################################
data(demonsnacks)
N <- nrow(demonsnacks)
y <- log(demonsnacks$Calories)
X <- cbind(1, as.matrix(log(demonsnacks[,c(1,4,10)]+1)))
J <- ncol(X)
for (j in 2:J) {X[,j] <- CenterScale(X[,j])}
mon.names <- "LP"
parm.names <- as.parm.names(list(beta=rep(0,J), sigma=0))
pos.beta <- grep("beta", parm.names)
pos.sigma <- grep("sigma", parm.names)
PGF <- function(Data) {
     beta <- rnorm(Data$J)
     sigma <- runif(1)
     return(c(beta, sigma))
     }
MyData <- list(J=J, PGF=PGF, X=X, mon.names=mon.names, 
     parm.names=parm.names, pos.beta=pos.beta, pos.sigma=pos.sigma, y=y)


###################################################
### code chunk number 4: LaplacesDemonTutorial.Stex:122-140
###################################################
Model <- function(parm, Data)
     {
     ### Parameters
     beta <- parm[Data$pos.beta]
     sigma <- interval(parm[Data$pos.sigma], 1e-100, Inf)
     parm[Data$pos.sigma] <- sigma
     ### Log-Prior
     beta.prior <- dnormv(beta, 0, 1000, log=TRUE)
     sigma.prior <- dhalfcauchy(sigma, 25, log=TRUE)
     ### Log-Likelihood
     mu <- tcrossprod(beta, Data$X)
     LL <- sum(dnorm(Data$y, mu, sigma, log=TRUE))
     ### Log-Posterior
     LP <- LL + sum(beta.prior) + sigma.prior
     Modelout <- list(LP=LP, Dev=-2*LL, Monitor=LP,
          yhat=rnorm(length(mu), mu, sigma), parm=parm)
     return(Modelout)
     }


###################################################
### code chunk number 5: LaplacesDemonTutorial.Stex:203-204
###################################################
Initial.Values <- c(rep(0,J), 1)


###################################################
### code chunk number 6: LaplacesDemonTutorial.Stex:211-212
###################################################
set.seed(666)


###################################################
### code chunk number 7: LaplacesDemonTutorial.Stex:219-220 (eval = FALSE)
###################################################
## help(LaplacesDemon) 


###################################################
### code chunk number 8: LaplacesDemonTutorial.Stex:225-228 (eval = FALSE)
###################################################
## Fit <- LaplacesDemon(Model, Data=MyData, Initial.Values,
##      Covar=NULL, Iterations=1000, Status=100, Thinning=1,
##      Algorithm="AFSS", Specs=list(A=500, B=NULL, m=100, n=0, w=1))


###################################################
### code chunk number 9: LaplacesDemonTutorial.Stex:246-249
###################################################
Fit <- LaplacesDemon(Model, Data=MyData, Initial.Values,
     Covar=NULL, Iterations=1000, Status=100, Thinning=1,
     Algorithm="AFSS", Specs=list(A=500, B=NULL, m=100, n=0, w=1))


###################################################
### code chunk number 10: LaplacesDemonTutorial.Stex:254-255 (eval = FALSE)
###################################################
## str(Fit)


###################################################
### code chunk number 11: LaplacesDemonTutorial.Stex:260-261
###################################################
Fit$Acceptance.Rate


###################################################
### code chunk number 12: LaplacesDemonTutorial.Stex:272-274 (eval = FALSE)
###################################################
## Fit
## print(Fit)


###################################################
### code chunk number 13: LaplacesDemonTutorial.Stex:279-280
###################################################
Consort(Fit)


###################################################
### code chunk number 14: LaplacesDemonTutorial.Stex:285-286 (eval = FALSE)
###################################################
## Fit$Posterior2


###################################################
### code chunk number 15: LaplacesDemonTutorial.Stex:309-309
###################################################



###################################################
### code chunk number 16: LaplacesDemonTutorial.Stex:311-312 (eval = FALSE)
###################################################
## plot(Fit, BurnIn=500, MyData, PDF=FALSE, Parms=NULL)


###################################################
### code chunk number 17: fig1
###################################################
par(mfrow=c(3,3))
BurnIn <- 500
for (j in 1:3){
     plot((BurnIn+1):Fit$Thinned.Samples,
          Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j],
          type="l", xlab="Thinned Samples", ylab="Value",
          main=MyData$parm.names[j])
     panel.smooth((BurnIn+1):Fit$Thinned.Samples, 
          Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j], pch="")
     plot(density(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j]),
          xlab="Value", main=MyData$parm.names[j])
     polygon(density(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j]),
          col="black", border="black")
     abline(v=0, col="red", lty=2)
     z <- acf(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j], plot=FALSE)
     se <- 1/sqrt(length(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j]))
     plot(z$lag, z$acf, ylim=c(min(z$acf,-2*se),1), type="h",
          main=MyData$parm.names[j], xlab="Lag", ylab="Correlation")
     abline(h=(2*se), col="red", lty=2)
     abline(h=(-2*se), col="red", lty=2)
     }


###################################################
### code chunk number 18: fig2
###################################################
par(mfrow=c(3,3))
for (j in 4:5){
     plot((BurnIn+1):Fit$Thinned.Samples,
          Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j],
          type="l", xlab="Thinned Samples", ylab="Value",
          main=MyData$parm.names[j])
     panel.smooth((BurnIn+1):Fit$Thinned.Samples, 
          Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j], pch="")
     plot(density(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j]),
          xlab="Value", main=MyData$parm.names[j])
     polygon(density(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j]),
          col="black", border="black")
     abline(v=0, col="red", lty=2)
     z <- acf(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j], plot=FALSE)
     se <- 1/sqrt(length(Fit$Posterior1[(BurnIn+1):Fit$Thinned.Samples,j]))
     plot(z$lag, z$acf, ylim=c(min(z$acf,-2*se),1), type="h",
          main=MyData$parm.names[j], xlab="Lag", ylab="Correlation")
     abline(h=(2*se), col="red", lty=2)
     abline(h=(-2*se), col="red", lty=2)
     }
plot((BurnIn+1):length(Fit$Deviance),
     Fit$Deviance[(BurnIn+1):length(Fit$Deviance)],
     type="l", xlab="Thinned Samples", ylab="Value", main="Deviance")
panel.smooth((BurnIn+1):length(Fit$Deviance), 
     Fit$Deviance[(BurnIn+1):length(Fit$Deviance)], pch="")
plot(density(Fit$Deviance[(BurnIn+1):length(Fit$Deviance)]),
     xlab="Value", main="Deviance")
polygon(density(Fit$Deviance[(BurnIn+1):length(Fit$Deviance)]),
     col="black", border="black")
abline(v=0, col="red", lty=2)
z <- acf(Fit$Deviance[(BurnIn+1):length(Fit$Deviance)], plot=FALSE)
se <- 1/sqrt(length(Fit$Deviance[(BurnIn+1):length(Fit$Deviance)]))
plot(z$lag, z$acf, ylim=c(min(z$acf,-2*se),1), type="h",
     main="Deviance", xlab="Lag", ylab="Correlation")
abline(h=(2*se), col="red", lty=2)
abline(h=(-2*se), col="red", lty=2)


###################################################
### code chunk number 19: fig3
###################################################
par(mfrow=c(2,3))
JJ <- NCOL(Fit$Monitor); nn <- NROW(Fit$Monitor)
for (j in 1:JJ){
     plot((BurnIn+1):nn, 
          Fit$Monitor[(BurnIn+1):nn,j],
          type="l", xlab="Thinned Samples", ylab="Value", 
          main=MyData$mon.names[j])
     panel.smooth((BurnIn+1):nn, 
          Fit$Monitor[(BurnIn+1):nn,j], pch="")
     plot(density(Fit$Monitor[(BurnIn+1):nn,j]), xlab="Value", 
          main=MyData$mon.names[j])
     polygon(density(Fit$Monitor[(BurnIn+1):nn,j]),
          col="black", border="black")
     abline(v=0, col="red", lty=2)
     z <- acf(Fit$Monitor[(BurnIn+1):nn,j], plot=FALSE)
     se <- 1/sqrt(length(Fit$Monitor[(BurnIn+1):nn,j]))
     plot(z$lag, z$acf, ylim=c(min(z$acf,-2*se),1), type="h",
          main=MyData$mon.names[j], xlab="Lag", ylab="Correlation")
     abline(h=(2*se), col="red", lty=2)
     abline(h=(-2*se), col="red", lty=2)
     }


###################################################
### code chunk number 20: LaplacesDemonTutorial.Stex:424-425 (eval = FALSE)
###################################################
## plot(BMK.Diagnostic(Fit$Posterior1[501:1000,]))


###################################################
### code chunk number 21: fig4
###################################################
par(mfrow=c(1,1))
plot(BMK.Diagnostic(Fit$Posterior1[501:1000,]))


###################################################
### code chunk number 22: LaplacesDemonTutorial.Stex:442-443 (eval = FALSE)
###################################################
## caterpillar.plot(Fit, Parms="beta")


###################################################
### code chunk number 23: fig5
###################################################
par(mfrow=c(1,1))
caterpillar.plot(Fit, Parms=1:4)


###################################################
### code chunk number 24: LaplacesDemonTutorial.Stex:462-463
###################################################
Pred <- predict(Fit, Model, MyData, CPUs=1)


###################################################
### code chunk number 25: LaplacesDemonTutorial.Stex:472-473
###################################################
summary(Pred, Discrep="Chi-Square")


###################################################
### code chunk number 26: LaplacesDemonTutorial.Stex:487-488 (eval = FALSE)
###################################################
## plot(Pred, Style="Density", Rows=1:9)


###################################################
### code chunk number 27: fig6
###################################################
par(mfrow=c(3,3))
for (j in 1:9){
     plot(density(Pred$yhat[j,]), xlab="Value",
          main=paste("Post. Pred. Plot of yhat[", j,
               ",]", sep=""), sub="Black=Density, Red=y")
     polygon(density(Pred$yhat[j,]), col="black", border="black")
     abline(v=Pred$y[j], col="red")
     }


###################################################
### code chunk number 28: LaplacesDemonTutorial.Stex:509-510 (eval = FALSE)
###################################################
## plot(Pred, Style="Fitted")


###################################################
### code chunk number 29: fig7
###################################################
par(mfrow=c(1,1))
temp <- summary(Pred, Quiet=TRUE)$Summary
plot(temp[,1], temp[,5], pch=16, cex=0.75,
     ylim=c(min(temp[,c(1,4:6)], na.rm=TRUE),
          max(temp[,c(1,4:6)], na.rm=TRUE)),
     xlab="y", ylab="yhat", main="Fitted")
for (i in 1:length(y)) {
     lines(c(temp[i,1], temp[i,1]),
          c(temp[i,4], temp[i,6]))}
panel.smooth(temp[,1], temp[,5], pch=16, cex=0.75)


###################################################
### code chunk number 30: LaplacesDemonTutorial.Stex:572-573 (eval = FALSE)
###################################################
## LaplacesDemon



library(monoreg)


### Name: risks
### Title: Absolute risks from 7 survival models
### Aliases: risks
### Keywords: datasets

### ** Examples

## Not run: 
##D rm(list=ls())
##D library(monoreg)
##D library(eha)
##D 
##D # Read the example data:
##D 
##D data(risks)
##D ftime <- (risks$tstop - risks$tstart)/max(risks$tstop - risks$tstart)
##D ftime <- ifelse(ftime == 0, ftime + 0.00001, ftime)
##D censvar <- risks$censvar
##D case <- censvar == 1
##D dcase <- censvar == 2
##D a <- risks$tstart
##D a2 <- a^2
##D nobs <- nrow(risks)
##D 
##D # Fit a simple parametric model to remove the effect of baseline age:
##D 
##D wmodel <- weibreg(Surv(ftime, case) ~ a + a2, shape=1)
##D summary(wmodel)
##D wcoef <- c(coef(wmodel), 0.0)
##D wlp <- crossprod(t(cbind(a, a2)), wcoef[1:(length(wcoef)-2)])
##D wpar <- exp(wcoef[(length(wcoef)-1):length(wcoef)])
##D 
##D whaz <- function(x, bz) {
##D     return(exp(bz) * (wpar[2] / wpar[1]) * (x / wpar[1])^(wpar[2] - 1))
##D }
##D chint <- function(x, bz) {
##D     return(exp(bz) * (x / wpar[1])^wpar[2])
##D }
##D croot <- function(x, bz, c) {
##D     return(chint(x, bz) - c)
##D }
##D 
##D # Age-matched case-base sample for model validation:
##D 
##D set.seed(1)
##D crate <- chint(ftime, wlp)
##D csrate <- cumsum(crate)
##D m <- sum(case) * 10
##D persons <- rep(1:nobs, rmultinom(1, m, crate/sum(crate)))
##D moments <- rep(NA, m)
##D for (i in 1:m) {
##D     u <- runif(1, 0.0, crate[persons[i]])
##D     moments[i] <- uniroot(croot, c(0.0, ftime[persons[i]]), c=u, 
##D                           bz=wlp[persons[i]])$root
##D }
##D plot(ecdf(risks$tstart[case]), pch=20, col='red')
##D plot(ecdf(risks$tstart[persons]), pch=20, col='blue', add=TRUE)
##D 
##D rate <- whaz(moments, wlp[persons])
##D mrate <- mean(rate)
##D 
##D d <- c(rep(0, m), rep(1, sum(censvar == 1)), rep(2, sum(censvar == 2)), censvar)
##D mom <- c(moments, ftime[censvar == 1], ftime[censvar == 2], rep(1.0, nobs))
##D per <- c(persons, (1:nobs)[censvar == 1], (1:nobs)[censvar == 2], 1:nobs)
##D 
##D include <- rep(c(1,0), c(m + sum(censvar == 1) + sum(censvar == 2), nobs))
##D predict <- as.numeric(!include)
##D 
##D offset <- log(sum(crate)/(m * whaz(mom, wlp[per])))
##D moffset <- rep(log(sum(crate)/(m * mrate)), length(mom))
##D 
##D sprob <- 1/exp(offset)
##D msprob <- 1/exp(moffset)
##D 
##D stz <- getcmat(2)
##D settozero <- rbind(stz[1,], stz[1,], stz[2:3,], stz[2:3,])
##D package <- 1:nrow(settozero)
##D cr <- c(1,0,rep(1,2),rep(0,2))
##D 
##D # Fit models removing the age effect:
##D 
##D agecir <- matrix(NA, nobs, 7)
##D for (i in 1:7) {
##D     agecir[,i] <- as.numeric(colMeans(
##D monosurv(niter=15000, burnin=5000, adapt=5000, refresh=10, thin=5, 
##D          birthdeath=10, timevar=1, seed=1, rhoa=0.1, rhob=0.1, 
##D          years=1.0, deltai=0.1, drange=6.0, predict=predict, include=include, 
##D          casestatus=d, sprob=msprob, offset=NULL, tstart=NULL, 
##D          axes=cbind(mom, risks[per,paste('model', i, sep='')]), 
##D          covariates=rep(1.0, length(per)), ccovariates=rep(1.0, length(per)), 
##D          settozero=settozero, package=package, cr=cr)$risk))
##D     print(i)
##D }
##D 
##D # Fit models without removing the age effect:
##D 
##D cir <- matrix(NA, nobs, 7)
##D for (i in 1:7) {
##D     cir[,i] <- as.numeric(colMeans(
##D monosurv(niter=15000, burnin=5000, adapt=5000, refresh=10, thin=5, 
##D          birthdeath=10, timevar=1, seed=1, rhoa=0.1, rhob=0.1, 
##D          years=1.0, deltai=0.1, drange=6.0, predict=predict, include=include, 
##D          casestatus=d, sprob=sprob, offset=NULL, tstart=NULL, 
##D          axes=cbind(mom, risks[per,paste('model', i, sep='')]), 
##D          covariates=rep(1.0, length(per)), ccovariates=rep(1.0, length(per)), 
##D          settozero=settozero, package=package, cr=cr)$risk))
##D     print(i)
##D }
##D 
##D # Calculate ROC curves:
##D 
##D for (i in 1:7) {
##D     probs <- as.numeric(risks[,paste('model', i, sep='')])
##D     cutoffs <- sort(unique(probs), decreasing=TRUE)
##D     truepos <- rep(NA, length(cutoffs))
##D     falsepos <- rep(NA, length(cutoffs))
##D     auc <- rep(0.0, length(cutoffs))
##D     for (j in 1:length(cutoffs)) {
##D         ind <- as.numeric(probs > cutoffs[j])    
##D         truepos[j] <- sum(ind * agecir[,i])/sum(agecir[,i])
##D         falsepos[j] <- sum(ind * (1.0 - agecir[,i]))/sum(1.0 - agecir[,i])
##D         if (j > 1)
##D             auc[j] = (truepos[j] + truepos[j-1]) * (falsepos[j] - falsepos[j-1])
##D     }
##D     auc <- cumsum(auc) * 0.5
##D     roc <- cbind(cutoffs, truepos, falsepos, auc)
##D     save(roc, file=paste('ageroc', i, sep=''))
##D }
##D 
##D for (i in 1:7) {
##D     probs <- as.numeric(risks[,paste('model', i, sep='')])
##D     cutoffs <- sort(unique(probs), decreasing=TRUE)
##D     truepos <- rep(NA, length(cutoffs))
##D     falsepos <- rep(NA, length(cutoffs))
##D     auc <- rep(0.0, length(cutoffs))
##D     for (j in 1:length(cutoffs)) {
##D         ind <- as.numeric(probs > cutoffs[j])    
##D         truepos[j] <- sum(ind * cir[,i])/sum(cir[,i])
##D         falsepos[j] <- sum(ind * (1.0 - cir[,i]))/sum(1.0 - cir[,i])
##D         if (j > 1)
##D             auc[j] = (truepos[j] + truepos[j-1]) * (falsepos[j] - falsepos[j-1])
##D     }
##D     auc <- cumsum(auc) * 0.5
##D     roc <- cbind(cutoffs, truepos, falsepos, auc)
##D     save(roc, file=paste('roc', i, sep=''))
##D }
##D 
##D # Plot ROC curves:
##D 
##D # postscript(file.path(getwd(), 'rocs.eps'), paper='special', width=10, height=5, 
##D #            horizontal=FALSE)
##D op <- par(cex=1, mar=c(3.75,3.75,0.25,0.25), mfrow=c(1,2), mgp=c(2.5,1,0))
##D 
##D plot(1, xlim=c(0,1), ylim=c(0,1), type='n', xlab='False positive fraction', 
##D      ylab='True positive fraction')
##D abline(0, 1, lty='dashed')
##D cols=c('darkgray','red','blue','darkgreen','orange','purple','magenta')
##D aucs <- NULL
##D for (i in 1:7) {
##D     load(file=paste('roc', i, sep=''))
##D     aucs <- c(aucs, max(roc[,4]))
##D     lines(roc[,3], roc[,2], type='s', lwd=2, col=cols[i])
##D     for (j in c(0.05,0.1,0.15,0.2)) {
##D         tp <- approx(roc[,1], roc[,2], xout=j)$y
##D         fp <- approx(roc[,1], roc[,3], xout=j)$y
##D         idx <- nobs - findInterval(j,sort(roc[,1]))
##D             points(fp, tp, col=cols[i], pch=20)
##D         if (i == 1)
##D             text(fp, tp-0.015, labels=j, pos=4, offset=0.25, col=cols[i], 
##D                  cex=0.9)
##D     }
##D }
##D legend('bottomright', legend=paste('Model ', 1:7, '; AUC=',     
##D        format(round(aucs, 3), nsmall=3, scientific=FALSE), sep=''), 
##D         col=cols, lty=rep('solid',7), lwd=rep(2,7))
##D 
##D plot(1, xlim=c(0,1), ylim=c(0,1), type='n', xlab='False positive fraction', 
##D      ylab='True positive fraction')
##D abline(0, 1, lty='dashed')
##D cols=c('darkgray','red','blue','darkgreen','orange','purple','magenta')
##D aucs <- NULL
##D for (i in 1:7) {
##D     load(file=paste('ageroc', i, sep=''))
##D     aucs <- c(aucs, max(roc[,4]))
##D     lines(roc[,3], roc[,2], type='s', lwd=2, col=cols[i])
##D     for (j in c(0.05,0.1,0.15,0.2)) {
##D         tp <- approx(roc[,1], roc[,2], xout=j)$y
##D         fp <- approx(roc[,1], roc[,3], xout=j)$y
##D         idx <- nobs - findInterval(j,sort(roc[,1]))
##D         points(fp, tp, col=cols[i], pch=20)
##D         if (i == 1)
##D             text(fp, tp-0.015, labels=j, pos=4, offset=0.25, col=cols[i], 
##D                  cex=0.9)
##D     }
##D }
##D legend('bottomright', legend=paste('Model ', 1:7, '; AUC=',     
##D        format(round(aucs, 3), nsmall=3, scientific=FALSE), sep=''), 
##D         col=cols, lty=rep('solid',7), lwd=rep(2,7))
##D 
##D par(op)
##D # dev.off()
## End(Not run)




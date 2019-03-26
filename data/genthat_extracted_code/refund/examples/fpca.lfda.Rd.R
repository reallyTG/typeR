library(refund)


### Name: fpca.lfda
### Title: Longitudinal Functional Data Analysis using FPCA
### Aliases: fpca.lfda

### ** Examples

  ## Not run: 
##D  
##D   ########################################
##D   ###   Illustration with real data    ###
##D   ########################################   
##D 
##D   data(DTI)
##D   MS <- subset(DTI, case ==1)  # subset data with multiple sclerosis (MS) case
##D 
##D   index.na <- which(is.na(MS$cca))  
##D   Y <- MS$cca; Y[index.na] <- fpca.sc(Y)$Yhat[index.na]; sum(is.na(Y))
##D   id <- MS$ID 
##D   visit.index <- MS$visit 
##D   visit.time <- MS$visit.time/max(MS$visit.time)
##D 
##D   lfpca.dti <- fpca.lfda(Y = Y, subject.index = id,  
##D                          visit.index = visit.index, obsT = visit.time, 
##D                          LongiModel.method = 'lme',
##D                          mFPCA.pve = 0.95)
##D                          
##D   TT <- seq(0,1,length.out=41); ss = seq(0,1,length.out=93)
##D   
##D   # estimated mean function
##D   persp(x = ss, y = TT, z = t(lfpca.dti$bivariateSmoothMeanFunc),
##D         xlab="s", ylab="visit times", zlab="estimated mean fn", col='light blue')
##D         
##D   # first three estimated marginal eigenfunctions
##D   matplot(ss, lfpca.dti$mFPCA.efunctions[,1:3], type='l', xlab='s', ylab='estimated eigen fn')
##D   
##D   # predicted scores function corresponding to first two marginal PCs
##D   matplot(TT, do.call(cbind, lapply(lfpca.dti$sFPCA.xiHat.bySubj, function(a) a[,1])),
##D           xlab="visit time (T)", ylab="xi_hat(T)", main = "k = 1", type='l')
##D   matplot(TT, do.call(cbind, lapply(lfpca.dti$sFPCA.xiHat.bySubj, function(a) a[,2])),
##D           xlab="visit time (T)", ylab="xi_hat(T)", main = "k = 2", type='l')
##D 
##D   # prediction of cca of first two subjects at T = 0, 0.5 and 1 (black, red, green)
##D   matplot(ss, t(lfpca.dti$fitted.values.all[[1]][c(1,21,41),]), 
##D          type='l', lty = 1, ylab="", xlab="s", main = "Subject = 1")    
##D   matplot(ss, t(lfpca.dti$fitted.values.all[[2]][c(1,21,41),]), 
##D          type='l', lty = 1, ylab="", xlab="s", main = "Subject = 2")    
##D      
##D   ########################################
##D   ### Illustration with simulated data ###
##D   ########################################   
##D 
##D   ###########################################################################################
##D   # data generation
##D   ###########################################################################################
##D   set.seed(1)
##D   n <- 100 # number of subjects
##D   ss <- seq(0,1,length.out=101) 
##D   TT <- seq(0, 1, length.out=41)
##D   mi <- runif(n, min=6, max=15)
##D   ij <- sapply(mi, function(a) sort(sample(1:41, size=a, replace=FALSE)))
##D   
##D   # error variances
##D   sigma <- 0.1 
##D   sigma_wn <- 0.2
##D 
##D   lambdaTrue <- c(1,0.5) # True eigenvalues
##D   eta1True <- c(0.5, 0.5^2, 0.5^3) # True eigenvalues
##D   eta2True <- c(0.5^2, 0.5^3) # True eigenvalues
##D   
##D   phi <- sqrt(2)*cbind(sin(2*pi*ss),cos(2*pi*ss))
##D   psi1 <- cbind(rep(1,length(TT)), sqrt(3)*(2*TT-1), sqrt(5)*(6*TT^2-6*TT+1))
##D   psi2 <- sqrt(2)*cbind(sin(2*pi*TT),cos(2*pi*TT))
##D   
##D   zeta1 <- sapply(eta1True, function(a) rnorm(n = n, mean = 0, sd = a))
##D   zeta2 <- sapply(eta2True, function(a) rnorm(n = n, mean = 0, sd = a))
##D   
##D   xi1 <- unlist(lapply(1:n, function(a) (zeta1 %*% t(psi1))[a,ij[[a]]] ))
##D   xi2 <- unlist(lapply(1:n, function(a) (zeta2 %*% t(psi2))[a,ij[[a]]] ))
##D   xi <- cbind(xi1, xi2)
##D   
##D   Tij <- unlist(lapply(1:n, function(i) TT[ij[[i]]] ))
##D   i <- unlist(lapply(1:n, function(i) rep(i, length(ij[[i]]))))
##D   j <- unlist(lapply(1:n, function(i) 1:length(ij[[i]])))
##D   
##D   X <- xi %*% t(phi)
##D   meanFn <- function(s,t){ 0.5*t + 1.5*s + 1.3*s*t}
##D   mu <- matrix(meanFn(s = rep(ss, each=length(Tij)), t=rep(Tij, length(ss)) ) , nrow=nrow(X))
##D 
##D   Y <- mu +  X + 
##D      matrix(rnorm(nrow(X)*ncol(phi), 0, sigma), nrow=nrow(X)) %*% t(phi) + #correlated error
##D      matrix(rnorm(length(X), 0, sigma_wn), nrow=nrow(X)) # white noise
##D 
##D   matplot(ss, t(Y[which(i==2),]), type='l', ylab="", xlab="functional argument", 
##D          main="observations from subject i = 2")
##D   # END: data generation
##D   
##D   ###########################################################################################
##D   # Illustration I : when covariance of scores from a mFPCA step is estimated using fpca.sc
##D   ###########################################################################################
##D   est <- fpca.lfda(Y = Y, 
##D                    subject.index = i, visit.index = j, obsT = Tij, 
##D                    funcArg = ss, numTEvalPoints = length(TT), 
##D                    newdata = data.frame(i = c(1:3), Ltime = c(Tij[1], 0.2, 0.5)), 
##D                    fbps.knots = 35, fbps.p = 3, fbps.m = 2,
##D                    LongiModel.method='fpca.sc',
##D                    mFPCA.pve = 0.95, mFPCA.knots = 35, mFPCA.p = 3, mFPCA.m = 2, 
##D                    sFPCA.pve = 0.95, sFPCA.nbasis = 10, sFPCA.npc = NULL,
##D                    gam.method = 'REML', gam.kT = 10)
##D   
##D   
##D   # mean function (true vs. estimated)
##D   par(mfrow=c(1,2))
##D   persp(x=TT, y = ss, z= t(sapply(TT, function(a) meanFn(s=ss, t = a))),
##D           xlab="visit times", ylab="s", zlab="true mean fn")
##D   persp(x = TT, y = ss, est$bivariateSmoothMeanFunc,
##D    xlab="visit times", ylab="s", zlab="estimated mean fn", col='light blue')
##D   
##D   ################   mFPCA step   ################
##D   par(mfrow=c(1,2))
##D   
##D   # marginal covariance fn (true vs. estimated)
##D   image(phi%*%diag(lambdaTrue)%*%t(phi))
##D   image(est$mFPCA.covar) 
##D   
##D   # eigenfunctions (true vs. estimated)
##D   matplot(ss, phi, type='l') 
##D   matlines(ss, cbind(est$mFPCA.efunctions[,1], est$mFPCA.efunctions[,2]), type='l', lwd=2)
##D   
##D   # scree plot
##D   plot(cumsum(est$mFPCA.scree.eval)/sum(est$mFPCA.scree.eval), type='l', 
##D        ylab = "Percentage of variance explained")
##D   points(cumsum(est$mFPCA.scree.eval)/sum(est$mFPCA.scree.eval), pch=16)
##D   
##D   ################   sFPCA step   ################
##D   par(mfrow=c(1,2))
##D   print(est$mFPCA.npc)  # k = 2
##D   
##D   # covariance of score functions for k = 1 (true vs. estimated)
##D   image(psi1%*%diag(eta1True)%*%t(psi1), main='TRUE')
##D   image(est$sFPCA.longDynCov.k[[1]], main='ESTIMATED')
##D   
##D   # covariance of score functions for k = 2 (true vs. estimated)
##D   image(psi2%*%diag(eta2True)%*%t(psi2))
##D   image(est$sFPCA.longDynCov.k[[2]])
##D   
##D   # estimated scores functions
##D   matplot(TT, do.call(cbind,lapply(est$sFPCA.xiHat.bySubj, function(a) a[,1])), 
##D           xlab="visit time", main="k=1", type='l', ylab="", col=rainbow(100, alpha = 1), 
##D           lwd=1, lty=1)
##D   matplot(TT, do.call(cbind,lapply(est$sFPCA.xiHat.bySubj, function(a) a[,2])), 
##D           xlab="visit time", main="k=2",type='l', ylab="", col=rainbow(100, alpha = 1), 
##D           lwd=1, lty=1)
##D   
##D   ################   In-sample and Out-of-sample Prediction   ################
##D   par(mfrow=c(1,2))
##D   # fitted
##D   matplot(ss, t(Y[which(i==1),]), type='l', ylab="", xlab="functional argument")
##D   matlines(ss, t(est$fitted.values[which(i==1),]), type='l', lwd=2)
##D   
##D  # sanity check : expect fitted and predicted (obtained using info from newdata) 
##D  #                values to be the same
##D  
##D   plot(ss, est$fitted.values[1,], type='p', xlab="", ylab="", pch = 1, cex=1)
##D   lines(ss, est$predicted.values[1,], type='l', lwd=2, col='blue')
##D   all.equal(est$predicted.values[1,], est$fitted.values[1,])
##D   
##D   ###########################################################################################
##D   # Illustration II : when covariance of scores from a mFPCA step is estimated using lmer
##D   ###########################################################################################
##D   est.lme <- fpca.lfda(Y = Y, 
##D                        subject.index = i, visit.index = j, obsT = Tij,
##D                        funcArg = ss, numTEvalPoints = length(TT), 
##D                        newdata = data.frame(i = c(1:3), Ltime = c(Tij[1], 0.2, 0.5)), 
##D                        fbps.knots = 35, fbps.p = 3, fbps.m = 2,
##D                        LongiModel.method='lme',
##D                        mFPCA.pve = 0.95, mFPCA.knots = 35, mFPCA.p = 3, mFPCA.m = 2, 
##D                        gam.method = 'REML', gam.kT = 10)
##D   
##D   par(mfrow=c(2,2))
##D   
##D   # fpca.sc vs. lme (assumes linearity)
##D   matplot(TT, do.call(cbind,lapply(est$sFPCA.xiHat.bySubj, function(a) a[,1])), 
##D           xlab="visit time", main="k=1", type='l', ylab="", col=rainbow(100, alpha = 1), 
##D           lwd=1, lty=1)
##D   matplot(TT, do.call(cbind,lapply(est$sFPCA.xiHat.bySubj, function(a) a[,2])), 
##D           xlab="visit time", main="k=2",type='l', ylab="", col=rainbow(100, alpha = 1), 
##D           lwd=1, lty=1)
##D           
##D   matplot(TT, do.call(cbind,lapply(est.lme$sFPCA.xiHat.bySubj, function(a) a[,1])), 
##D           xlab="visit time", main="k=1", type='l', ylab="", col=rainbow(100, alpha = 1), 
##D           lwd=1, lty=1)
##D   matplot(TT, do.call(cbind,lapply(est.lme$sFPCA.xiHat.bySubj, function(a) a[,2])), 
##D           xlab="visit time", main="k=2", type='l', ylab="", col=rainbow(100, alpha = 1),
##D           lwd=1, lty=1)
##D   
## End(Not run)




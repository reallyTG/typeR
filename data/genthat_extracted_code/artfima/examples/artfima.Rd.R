library(artfima)


### Name: artfima
### Title: MLE for ARTFIMA model
### Aliases: artfima
### Keywords: ts

### ** Examples

artfima(Nile) #Nile is a built in dataset in R
artfima(Nile, likAlg = "exact")
#
#fitting a high-order AR using recursion
## Not run: 
##D #This may take 3 to 6 hours if exact MLE used!
##D #But Whittle MLE doesn't work properly for this example!!
##D  data(SB32)
##D  z <- SB32
##D  likAlg <- "exact"
##D  pmax <- 30
##D  startTime <- proc.time()[3]
##D  ic <- matrix(numeric(0), ncol=3, nrow=pmax+1)
##D  out <- artfima(z, arimaOrder=c(0,0,0), likAlg=likAlg)
##D  ic[1, 1] <- out$aic
##D  ic[1, 2] <- out$bic
##D  ic[1, 3] <- out$LL
##D  b1 <- c(out$b0, 0)
##D  for (i in 1:pmax) {
##D   out <- artfima(z, arimaOrder=c(i,0,0), b0=b1, likAlg=likAlg)
##D   b1 <- c(out$b0, 0)
##D   ic[i+1, 1] <- out$aic
##D   ic[i+1, 2] <- out$bic
##D   ic[i+1, 3] <- out$LL
##D  }
##D  endTime <- proc.time()[3]
##D  (totTime <- endTime-startTime)
##D  plot(0:pmax, ic[,1], xlab="AR order", ylab="AIC", pch=20, col="blue")
##D  indBest <- which.min(ic[,1])
##D  pBest <- indBest-1
##D  icBest <- ic[indBest,1]
##D  abline(h=icBest, col="brown")
##D  abline(v=pBest, col="brown")
##D  plot(0:pmax, ic[,2], xlab="AR order", ylab="BIC", pch=20, col="blue")
##D  indBest <- which.min(ic[,2])
##D  pBest <- indBest-1
##D  icBest <- ic[indBest,2]
##D  abline(h=icBest, col="brown")
##D  abline(v=pBest, col="brown")
##D  plot(0:pmax, ic[,3], xlab="AR order", ylab="log-lik", pch=20)
##D  
## End(Not run)#end dontrun
#
#setting new boundary limit
## Not run: 
##D data(SB32)
##D #ARTFIMA(1,0,2) - MLE for d on boundar, dHat = 10
##D artfima(SB32, arimaOrder=c(1,0,2))
##D #note:
##D #log-likelihood = -10901.14, AIC = 21816.29, BIC = 21862.41
##D #Warning: estimates converged to boundary!
##D #mean     -0.5558988 8.443794e-02
##D #d         9.9992097 1.396002e-05
##D #lambda    2.9304658 8.050071e-02
##D #phi(1)    0.9271892 6.862294e-03
##D #theta(1)  0.8440911 1.709824e-02
##D #theta(2) -0.3650004 2.744227e-02
##D #
##D #now reset upper limit dMax and lambdaMax
##D #NOTE - there is only a very small improvement in the log-likelihood
##D artfima(SB32, arimaOrder=c(1,0,2), lambdaMax=20, dMax=40)
##D #ARTFIMA(1,0,2), MLE Algorithm: exact, optim: BFGS
##D #snr = 4.665, sigmaSq = 3.38228734331338
##D #log-likelihood = -10900.56, AIC = 21815.12, BIC = 21861.25
##D #               est.    se(est.)
##D #mean     -0.5558988  0.08443794
##D #d        27.0201256 36.94182328
##D #lambda    3.9412050  1.38296970
##D #phi(1)    0.9276901  0.00676589
##D #theta(1)  0.8342879  0.01715041
##D #theta(2) -0.3644787  0.02691869
## End(Not run) 
 




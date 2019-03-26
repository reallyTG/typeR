library(ScreenClean)


### Name: ThresholdGram
### Title: Thresholds the gram matrix
### Aliases: ThresholdGram

### ** Examples

p <-10
off.diag<-matrix(runif(p^2),p,p)
omega <- (off.diag+t(off.diag))*0.3
diag(omega) <- 1
omega.omega<-ThresholdGram(omega,0.3)
omega.omega$gram
omega.omega$gram.bias




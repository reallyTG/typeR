library(CVThresh)


### Name: cvwavelet
### Title: Wavelet reconstruction by level-dependent Cross-Validation
### Aliases: cvwavelet
### Keywords: nonparametric

### ** Examples

data(ipd)
y <- as.numeric(ipd); n <- length(y); nlevel <- log2(n)
ywd <- wd(y)
#out <- cvwavelet(y=y, ywd=ywd, cv.optlevel=c(3:(nlevel-1)), 
#                     cv.bsize=2, cv.kfold=4)

#ts.plot(ts(out$yc, start=1229.98, deltat=0.02, frequency=50),
#   main="Level-dependent Cross Validation", xlab = "Seconds", ylab="")




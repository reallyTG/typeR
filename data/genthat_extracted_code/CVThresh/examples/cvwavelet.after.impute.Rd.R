library(CVThresh)


### Name: cvwavelet.after.impute
### Title: Cross-Validation Wavelet Shrinkage after imputation
### Aliases: cvwavelet.after.impute
### Keywords: nonparametric

### ** Examples

data(ipd)
y <- as.numeric(ipd); n <- length(y); nlevel <- log2(n)

set.seed(1)
cv.index <- cvtype(n=n, cv.bsize=2, cv.kfold=4, cv.random=TRUE)$cv.index
yimpute <- cvimpute.by.wavelet(y=y, impute.index=cv.index)$yimpute

ywd <- wd(y)

#out <- cvwavelet.after.impute(y=y, ywd=ywd, yimpute=yimpute,
#cv.index=cv.index, cv.optlevel=c(3:(nlevel-1)))

#ts.plot(ts(out$yc, start=1229.98, deltat=0.02, frequency=50),
#   main="Level-dependent Cross Validation", xlab = "Seconds", ylab="")

##### Specifying thresholding structure
# cv.optlevel <- c(3) # Threshold (level 3 to finest level) at the same time.
# cv.optlevel <- c(3, 5) # Threshold two groups of resolution levels,
                         # (level 3, 4) and  (level 5 to finest level).
# cv.optlevel <- c(3,4,5,6,7,8) # Threshold each resolution level 3 to 8.




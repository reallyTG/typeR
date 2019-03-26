library(CVThresh)


### Name: cvimpute.by.wavelet
### Title: Imputation by wavelet
### Aliases: cvimpute.by.wavelet
### Keywords: nonparametric

### ** Examples

# 8-fold cross-validation scheme with block size 2
set.seed(1)
cv.index <- cvtype(n=1024, cv.bsize=2, cv.kfold=8, cv.random=TRUE)$cv.index

# Generate 1024 observation from Heavisine function
snr <- 5
testdata <- heav(1024)
x <- testdata$x
y <- testdata$meanf + rnorm(1024, 0, testdata$sdf / snr)

# Impute by wavelet
yimpute <- cvimpute.by.wavelet(y=y, impute.index=cv.index)$yimpute

# Compare imputed values and observations
par(mar=0.1+c(4,4,2,1))
plot(y, yimpute, xlab="Observations", ylab="Imputed Values",
     main="Piecewise Polynomial", cex=0.5);abline(0,1)




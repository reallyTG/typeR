library(EMD)


### Name: emddenoise
### Title: Denoising by EMD and Thresholding
### Aliases: emddenoise
### Keywords: nonparametric

### ** Examples

ndata <- 1024
tt <- seq(0, 9, length=ndata)
meanf <- (sin(pi*tt) + sin(2*pi*tt) + sin(6*pi*tt)) * (0.0<tt & tt<=3.0) + 
 (sin(pi*tt) + sin(6*pi*tt)) * (3.0<tt & tt<=6.0) +
 (sin(pi*tt) + sin(6*pi*tt) + sin(12*pi*tt)) * (6.0<tt & tt<=9.0)
snr <- 3.0
sigma <- c(sd(meanf[tt<=3]) / snr, sd(meanf[tt<=6 & tt>3]) / snr, 
sd(meanf[tt>6]) / snr)
set.seed(1)
error <- c(rnorm(sum(tt<=3), 0, sigma[1]), 
rnorm(sum(tt<=6 & tt>3), 0, sigma[2]), rnorm(sum(tt>6), 0, sigma[3]))
xt <- meanf + error 

cv.index <- cvtype(n=ndata, cv.kfold=2, cv.random=FALSE)$cv.index 

## Not run: 
##D try10 <- emddenoise(xt, cv.index=cv.index, cv.level=2, by.imf=TRUE)
##D 
##D par(mfrow=c(2, 1), mar=c(2, 1, 2, 1))
##D plot(xt, type="l", main="noisy signal")
##D lines(meanf, lty=2)
##D plot(try10$dxt, type="l", main="denoised signal")
##D lines(meanf, lty=2)
## End(Not run)




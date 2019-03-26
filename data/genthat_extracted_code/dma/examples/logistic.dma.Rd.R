library(dma)


### Name: logistic.dma
### Title: Dynamic model averaging for binary outcomes
### Aliases: logistic.dma logistic.dma.default print.logistic.dma
###   plot.logistic.dma dlogr.init dlogr.predict dlogr.step laplace.fn
###   tunemat.fn logdma.init logdma.update logdma.predict logdma.average

### ** Examples

# simulate some data to test
# first, static coefficients
coef <- c(.08,-.4,-.1)
coefmat <- cbind(rep(coef[1],200),rep(coef[2],200),rep(coef[3],200))
# then, dynamic ones
coefmat <- cbind(coefmat,seq(1,.45,length.out=nrow(coefmat)),
            seq(-.75,-.15,length.out=nrow(coefmat)),
            c(rep(-1.5,nrow(coefmat)/2),rep(-.5,nrow(coefmat)/2)))
npar <- ncol(coefmat)-1

# simulate data
set.seed(1234)
dat <- matrix(rnorm(200*(npar),0,1),200,(npar))
ydat <- exp(rowSums((cbind(rep(1,nrow(dat)),dat))[1:100,]*coefmat[1:100,]))/
          (1+exp(rowSums(cbind(rep(1,nrow(dat)),dat)[1:100,]*coefmat[1:100,])))
y <- c(ydat,exp(rowSums(cbind(rep(1,nrow(dat)),dat)[-c(1:100),c(1,5,6)]*
               coefmat[-c(1:100),c(1,5,6)]))/
          (1+exp(rowSums(cbind(rep(1,nrow(dat)),dat)[-c(1:100),c(1,5,6)]*
               coefmat[-c(1:100),c(1,5,6)]))))
u <- runif (length(y))
y <- as.numeric (u < y)

# Consider three candidate models
mmat <- matrix(c(1,1,1,1,1,0,0,0,1,1,1,0,1,0,1),3,5, byrow = TRUE)

# Fit model and plot
# autotuning is turned off for this demonstration example
ldma.test <- logistic.dma(dat, y, mmat, lambda = .99, alpha = .99, 
    autotune = FALSE, initialsamp = 20)
plot(ldma.test)

# Using DMA in a "streaming" mode
modl <- logdma.init(dat[1:20,], y[1:20], mmat)
yhat <- matrix(0, ncol=3, nrow=200)
for(i in 21:200){
  # if prediction is desired, use logdma.predict
  yhat[i,] <- logdma.predict(modl, dat[i,])
  # update
  modl <- logdma.update(modl, dat[i,], y[i], 
                lambda = .99, autotune = FALSE)
}
# the averaging step could be also done within the loop above
ldma.stream <- logdma.average(modl, alpha = .99)
plot(ldma.stream)




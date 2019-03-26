library(PtProcess)


### Name: residuals
### Title: Residuals of a Point Process Model
### Aliases: residuals residuals.mpp residuals.linksrm
### Keywords: methods

### ** Examples

TT <- c(0, 1000)
bvalue <- 1
params <- c(-2.5, 0.01, 0.8, bvalue*log(10))

x <- mpp(data=NULL,
         gif=srm_gif,
         marks=list(NULL, rexp_mark),
         params=params,
         gmap=expression(params[1:3]),
         mmap=expression(params[4]),
         TT=TT)
x <- simulate(x, seed=5)

tau <- residuals(x)

plot(tau, ylab="Transformed Time", xlab="Event Number")
abline(a=0, b=1, lty=2, col="red")

#   represent as a cusum
plot(tau - 1:length(tau), ylab="Cusum of Transformed Time", xlab="Event Number")
abline(h=0, lty=2, col="red")




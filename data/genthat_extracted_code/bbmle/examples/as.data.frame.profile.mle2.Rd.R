library(bbmle)


### Name: as.data.frame.profile.mle2
### Title: convert profile to data frame
### Aliases: as.data.frame.profile.mle2 coerce,profile.mle2-method
###   coerce,profile.mle2,data.frame-method
### Keywords: misc

### ** Examples

  ## use as.data.frame and lattice to plot profiles
  x <- 0:10
  y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
  library(bbmle)
  LL <- function(ymax=15, xhalf=6) {
        -sum(stats::dpois(y, lambda=ymax/(1+x/xhalf), log=TRUE))
    }
  ## uses default parameters of LL
  fit1 <- mle2(LL)
  p1 <- profile(fit1)
  d1 <- as.data.frame(p1)
  library(lattice)
  xyplot(abs(z)~focal|param,data=d1,
    subset=abs(z)<3,
    type="b",
    xlab="",
    ylab=expression(paste(abs(z),
    " (square root of ",Delta," deviance)")),
    scale=list(x=list(relation="free")))




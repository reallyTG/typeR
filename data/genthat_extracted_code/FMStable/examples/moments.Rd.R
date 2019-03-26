library(FMStable)


### Name: moments
### Title: Convolutions of Finite Moment Log Stable Distributions and the
###   Moments of such Distributions
### Aliases: iidcombine moments
### Keywords: distribution

### ** Examples

yearDsn <- fitGivenQuantile(mean=1, sd=2, prob=.7, value=.1)
upper <- exp(-yearDsn$location)	# Only sensible for alpha<.5
x <- exp(seq(from=log(.0001), to=log(upper), length=50))
plot(x, pFMstable(x, yearDsn), type="l", ylim=c(.2,1), lwd=2, xlab="Price",
  ylab="Distribution function of future price")
half <- iidcombine(.5, yearDsn)
lines(x, pFMstable(x, half), lty=2, lwd=2)
quarter <- iidcombine(.25, yearDsn)
lines(x, pFMstable(x, quarter), lty=3, lwd=2)
legend("bottomright", legend=paste(c("1","1/2","1/4"),"year"), lty=c(1,2,3),
  lwd=c(2,2,2))
moments(1:2, yearDsn)
moments(1:2, half)
moments(1:2, quarter)

# Check logstable against lognormal
iidcombine(2, setMomentsFMstable(.5, .2, alpha=2))
p <- lnorm.param(.5, .2)
2*p$meanlog		# Gives the mean
log(p$sdlog)	# Gives the logscale




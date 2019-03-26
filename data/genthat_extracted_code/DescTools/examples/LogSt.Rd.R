library(DescTools)


### Name: LogSt
### Title: Started Logarithmic Transformation and Its Inverse
### Aliases: LogSt LogStInv
### Keywords: math

### ** Examples

dd <- c(seq(0,1,0.1), 5 * 10^rnorm(100, 0, 0.2))
dd <- sort(dd)
r.dl <- LogSt(dd)
plot(dd, r.dl, type="l")
abline(v=attr(r.dl, "threshold"), lty=2)

x <- rchisq(df=3, n=100)
# should give 0 (or at least something small):
LogStInv(LogSt(x)) - x




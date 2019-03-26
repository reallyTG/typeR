library(pvar)


### Name: PvarBreakTest
### Title: Structural break test
### Aliases: PvarBreakTest plot.PvarBreakTest summary.PvarBreakTest

### ** Examples

set.seed(1)
MiuDiff <- 0.3
x <- rnorm(250*4, rep(c(0, MiuDiff, 0, MiuDiff), each=250))

plot(x, pch=19, cex=0.5, main='original data, with several shifts of mean')
k <- 50
moveAvg <- filter(x, rep(1/k, k))
lines(time(x), moveAvg, lwd=2, col=2)
legend('topleft', c('sample', 'moving average (k='%.%k%.%')'),
       lty=c(NA,1), lwd=c(NA, 2), col=1:2, pch=c(19,NA), pt.cex=c(0.7,1)
       ,inset = .03, bg='antiquewhite1')

xtest <- PvarBreakTest(x)
plot(xtest)




library(emon)


### Name: generate.trend
### Title: Generates a set of mean values.
### Aliases: generate.trend

### ** Examples

lin0 = generate.trend(nyears=10, change=0, type="linear")
lin5 = generate.trend(nyears=10, change=5, type="linear")
inc5 = generate.trend(nyears=10, change=5, type="incident", changeyear=6)
step5 = generate.trend(nyears=10, change=5, type="step", changeyear=6)
updeven = generate.trend(nyears=10, change=5, type="updown", changeyear=5, symmetric=TRUE)
updodd = generate.trend(nyears=9, change=5, type="updown", changeyear=3)

par(mfrow=c(2,3))
plot(lin0$i, lin0$mu, type="o", pch=16, xlab='Time', ylab='Y')
plot(lin5$i, lin5$mu, type="o", pch=16, xlab='Time', ylab='Y')
plot(inc5$i, inc5$mu, type="o", pch=16, xlab='Time', ylab='Y')
plot(step5$i, step5$mu, type="o", pch=16, xlab='Time', ylab='Y')
plot(updeven$i, updeven$mu, type="o", pch=16, xlab='Time', ylab='Y')
plot(updodd$i, updodd$mu, type="o", pch=16, xlab='Time', ylab='Y')




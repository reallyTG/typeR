library(astsa)


### Name: tsplot
### Title: Time Series Plot
### Aliases: tsplot
### Keywords: ts

### ** Examples

tsplot(soi, col=4)
#
tsplot(soi, main="Southern Oscillation Index")
#
par(mfrow=2:1)
tsplot(soi, main="Title for Both")
tsplot(rec)
#
tsplot(1:453, soi, ylab='SOI', xlab='Month')




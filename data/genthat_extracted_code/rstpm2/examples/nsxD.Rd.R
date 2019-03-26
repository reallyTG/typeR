library(rstpm2)


### Name: nsxD
### Title: Generate a Basis Matrix for the first derivative of Natural
###   Cubic Splines (with eXtensions)
### Aliases: nsxD
### Keywords: smooth

### ** Examples

require(stats); require(graphics); require(splines)
nsx(women$height, df = 5)
summary(fm1 <- lm(weight ~ ns(height, df = 5), data = women))

## example of safe prediction
plot(women, xlab = "Height (in)", ylab = "Weight (lb)")
ht <- seq(57, 73, length.out = 200)
lines(ht, predict(fm1, data.frame(height=ht)))





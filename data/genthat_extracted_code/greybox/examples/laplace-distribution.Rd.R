library(greybox)


### Name: dlaplace
### Title: Laplace Distribution
### Aliases: dlaplace plaplace qlaplace rlaplace
### Keywords: distribution

### ** Examples

x <- dlaplace(c(-100:100)/10, 0, 1)
plot(x, type="l")

x <- plaplace(c(-100:100)/10, 0, 1)
plot(x, type="l")

qlaplace(c(0.025,0.975), 0, c(1,2))

x <- rlaplace(1000, 0, 1)
hist(x)





library(greybox)


### Name: dalaplace
### Title: Asymmetric Laplace Distribution
### Aliases: dalaplace palaplace qalaplace ralaplace
### Keywords: distribution

### ** Examples

x <- dalaplace(c(-100:100)/10, 0, 1, 0.2)
plot(x, type="l")

x <- palaplace(c(-100:100)/10, 0, 1, 0.2)
plot(x, type="l")

qalaplace(c(0.025,0.975), 0, c(1,2), c(0.2,0.3))

x <- ralaplace(1000, 0, 1, 0.2)
hist(x)





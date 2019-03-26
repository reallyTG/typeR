library(greybox)


### Name: dfnorm
### Title: Folded Normal Distribution
### Aliases: dfnorm pfnorm qfnorm rfnorm
### Keywords: distribution

### ** Examples

x <- dfnorm(c(-1000:1000)/200, 0, 1)
plot(x, type="l")

x <- pfnorm(c(-1000:1000)/200, 0, 1)
plot(x, type="l")

qfnorm(c(0.025,0.975), 0, c(1,2))

x <- rfnorm(1000, 0, 1)
hist(x)





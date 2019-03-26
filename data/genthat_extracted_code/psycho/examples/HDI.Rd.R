library(psycho)


### Name: HDI
### Title: Highest Density Intervals (HDI).
### Aliases: HDI

### ** Examples

library(psycho)

distribution <- rnorm(1000, 0, 1)
HDI_values <- HDI(distribution)
print(HDI_values)
plot(HDI_values)
summary(HDI_values)

x <- matrix(rexp(200), 100)
HDI_values <- HDI(x)




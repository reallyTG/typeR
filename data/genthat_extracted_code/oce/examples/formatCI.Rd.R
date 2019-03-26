library(oce)


### Name: formatCI
### Title: Confidence interval in parenthetic notation
### Aliases: formatCI

### ** Examples

x <- seq(0, 1, length.out=300)
y <- rnorm(n=300, mean=10, sd=1) * x
m <- lm(y~x)
print(formatCI(model=m))




library(rafalib)


### Name: shist
### Title: smooth histogram
### Aliases: shist

### ** Examples

set.seed(1)
x = rnorm(50)
par(mfrow=c(2,1))
hist(x, breaks=-5:5)
shist(x, unit=1, xlim=c(-5,5))




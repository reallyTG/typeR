library(samplingbook)


### Name: money
### Title: Money Data Frame
### Aliases: money
### Keywords: datasets

### ** Examples

data(money)
print(money)

# Usage of mbes()
mu.X <-  mean(money$X)
x <- money$X[which(!is.na(money$y))]
y <- na.omit(money$y)
# estimation
mbes(y~x, aux=mu.X, N=13, method='all')




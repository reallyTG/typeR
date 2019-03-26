library(Emcdf)


### Name: initF
### Title: Initialize threads and split data
### Aliases: initF

### ** Examples

n = 10^5
set.seed(123)
x = rnorm(n)
y = rnorm(n)
z = rnorm(n)
data = cbind(x, y, z)

#decide thread number
num = coreNum() - 1

#initialize threads
obj = initF(data, num)

#compute empirical CDF
emcdf(obj, c(0.5, 0.5, 0.5))





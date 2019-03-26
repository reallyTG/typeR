library(samplingbook)


### Name: pop
### Title: Small Suppositious Sampling Example
### Aliases: pop
### Keywords: datasets

### ** Examples

data(pop)
print(pop)

## 1) Usage of Smean()
data(pop)
Y <- pop$Y
Y
# Draw a random sample pop size=3
set.seed(93456)
y <- sample(x = Y, size = 3)
sort(y)
# Estimation with infiniteness correction
est <- Smean(y = y, N = length(pop$Y))
est

## 2) Usage of mbes()
data(pop)
# Draw a random sample of size=3
set.seed(802016)
data <- pop[sample(1:5, size=3),]
names(data) <- c('id','x','y')
# difference estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='diff', level=0.95)
# ratio estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='ratio', level=0.95)
# regression estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='regr', level=0.95)




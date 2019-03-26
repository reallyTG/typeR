library(selectiveInference)


### Name: plot.fs
### Title: Plot function for forward stepwise regression
### Aliases: plot.fs

### ** Examples

set.seed(33)
n = 50
p = 10
sigma = 1
x = matrix(rnorm(n*p),n,p)
beta = c(3,2,rep(0,p-2))
y = x%*%beta + sigma*rnorm(n)

# run forward stepwise, plot results
fsfit = fs(x,y)
plot(fsfit)




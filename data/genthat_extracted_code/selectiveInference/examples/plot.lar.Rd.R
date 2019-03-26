library(selectiveInference)


### Name: plot.lar
### Title: Plot function for least angle regression
### Aliases: plot.lar

### ** Examples

set.seed(43)
n = 50
p = 10
sigma = 1
x = matrix(rnorm(n*p),n,p)
beta = c(3,2,rep(0,p-2))
y = x%*%beta + sigma*rnorm(n)

# run LAR, plot results
larfit = lar(x,y)
plot(larfit)




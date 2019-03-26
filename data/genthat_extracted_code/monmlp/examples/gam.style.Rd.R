library(monmlp)


### Name: gam.style
### Title: GAM-style effects plots for interpreting MLP and MONMLP models
### Aliases: gam.style

### ** Examples

set.seed(1)
x <- matrix(runif(350*6), ncol=6)
y <- as.matrix(5*sin(10*x[,1]*x[,2]) + 20*(x[,3]-0.5)^2 -
               10*x[,4] + 20*x[,5]*x[,6])

w <- monmlp.fit(x = x, y = y, hidden1 = 4, n.trials = 1,
                iter.max = 500)

for (i in seq(ncol(x))) gam.style(x, weights = w, column = i)




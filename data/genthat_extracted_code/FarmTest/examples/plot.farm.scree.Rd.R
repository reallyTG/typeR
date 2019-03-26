library(FarmTest)


### Name: plot.farm.scree
### Title: Diagnostic plots from factor-finding
### Aliases: plot.farm.scree

### ** Examples

set.seed(100)
p = 100
n = 20
epsilon = matrix(rnorm( p*n, 0,1), nrow = n)
B = matrix(rnorm(p*3,0,1), nrow=p)
fx = matrix(rnorm(3*n, 0,1), nrow = n)
X = fx%*%t(B)+ epsilon
output = farm.scree(X, cv=FALSE)
plot(output)
plot(output, scree.plot=FALSE, col="blue", main="Customized plot")





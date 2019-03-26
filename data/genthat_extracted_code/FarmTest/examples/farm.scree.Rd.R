library(FarmTest)


### Name: farm.scree
### Title: Diagnostic plots and quantities arising from estimating the
###   number of underlying factors
### Aliases: farm.scree

### ** Examples

set.seed(100)
p = 100
n = 20
epsilon = matrix(rnorm( p*n, 0,1), nrow = n)
B = matrix(rnorm(p*3,0,1), nrow=p)
fx = matrix(rnorm(3*n, 0,1), nrow = n)
X = fx%*%t(B)+ epsilon
output = farm.scree(X,show.plot = TRUE, cv=FALSE)
output = farm.scree(X,show.plot = FALSE, cv=FALSE, K.scree=5, K.factors =10)
output
plot(output, scree.plot=FALSE, col="blue", main="Customized plot")





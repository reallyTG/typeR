library(refund)


### Name: fosr.vs
### Title: Function-on Scalar Regression with variable selection
### Aliases: fosr.vs

### ** Examples

## Not run: 
##D set.seed(100)
##D 
##D I = 100
##D p = 20
##D D = 50
##D grid = seq(0, 1, length = D)
##D 
##D beta.true = matrix(0, p, D)
##D beta.true[1,] = sin(2*grid*pi)
##D beta.true[2,] = cos(2*grid*pi)
##D beta.true[3,] = 2
##D 
##D psi.true = matrix(NA, 2, D)
##D psi.true[1,] = sin(4*grid*pi)
##D psi.true[2,] = cos(4*grid*pi)
##D lambda = c(3,1)
##D 
##D set.seed(100)
##D 
##D X = matrix(rnorm(I*p), I, p)
##D C = cbind(rnorm(I, mean = 0, sd = lambda[1]), rnorm(I, mean = 0, sd = lambda[2]))
##D 
##D fixef = X%*%beta.true
##D pcaef = C %*% psi.true
##D error = matrix(rnorm(I*D), I, D)
##D 
##D Yi.true = fixef
##D Yi.pca = fixef + pcaef
##D Yi.obs = fixef + pcaef + error
##D 
##D data = as.data.frame(X)
##D data$Y = Yi.obs
##D fit.fosr.vs = fosr.vs(Y~., data = data, method="grMCP")
##D plot(fit.fosr.vs)
## End(Not run)






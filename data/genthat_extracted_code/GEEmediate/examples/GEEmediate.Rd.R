library(GEEmediate)


### Name: GEEmediate
### Title: Mediation Analysis for Generalized Linear Models Using the
###   Difference Method
### Aliases: GEEmediate

### ** Examples

## Not run: 
##D SimNormalData <- function(n,beta1.star = 1, p = 0.3, rho =0.4, inter =  0)
##D {
##D  beta2 <- (p/rho)*beta1.star
##D  beta1 <- (1-p)*beta1.star
##D  XM <- MASS::mvrnorm(n, mu = c(0,0), Sigma = matrix(c(1,rho,rho,1),2,2))
##D  X <- XM[,1]
##D  M <- XM[,2]
##D  beta <- c(inter, beta1, beta2)
##D  print(beta)
##D  Y <- cbind(rep(1,n),XM)%*%beta+rnorm(n,0,sd = 1)
##D  return(data.frame(X = X, M = M, Y = Y))
##D }
##D set.seed(314)
##D df <- SimNormalData(500)
##D GEEmediate(Y ~ X + M, exposure = "X", mediator = "M", df = df)
## End(Not run)






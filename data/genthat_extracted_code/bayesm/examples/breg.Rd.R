library(bayesm)


### Name: breg
### Title: Posterior Draws from a Univariate Regression with Unit Error
###   Variance
### Aliases: breg
### Keywords: models regression distribution

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=1000} else {R=10}

## simulate data
set.seed(66)
n = 100
X = cbind(rep(1,n), runif(n)); beta = c(1,2)
y = X %*% beta + rnorm(n)

## set prior
betabar = c(0,0)
A = diag(c(0.05, 0.05))

## make draws from posterior
betadraw = matrix(double(R*2), ncol = 2)
for (rep in 1:R) {betadraw[rep,] = breg(y,X,betabar,A)}

## summarize draws
mat = apply(betadraw, 2, quantile, probs=c(0.01, 0.05, 0.50, 0.95, 0.99))
mat = rbind(beta,mat); rownames(mat)[1] = "beta"
print(mat)




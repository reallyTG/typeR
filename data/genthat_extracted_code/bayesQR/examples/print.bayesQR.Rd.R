library(bayesQR)


### Name: print.bayesQR
### Title: Prints the contents of 'bayesQR' object to the console
### Aliases: print.bayesQR

### ** Examples

# Simulate data from heteroskedastic regression
set.seed(666)
n <- 200
X <- runif(n=n,min=0,max=10)
y <- 1 + 2*X + rnorm(n=n, mean=0, sd=.6*X)

# Analyze 0.5 quantile using default prior
out <- bayesQR(y ~ X, ndraw=5000) 

# Print the bayesQR object
print(out)




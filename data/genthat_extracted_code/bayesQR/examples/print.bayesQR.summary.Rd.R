library(bayesQR)


### Name: print.bayesQR.summary
### Title: Prints the contents of 'bayesQR.summary' object to the console
### Aliases: print.bayesQR.summary

### ** Examples

# Simulate data from heteroskedastic regression
set.seed(666)
n <- 200
X <- runif(n=n,min=0,max=10)
y <- 1 + 2*X + rnorm(n=n, mean=0, sd=.6*X)

# Analyze 0.5 quantile using default prior and adaptive lasso
out <- bayesQR(y ~ X, alasso=TRUE, ndraw=5000) 

# Return Bayes estimates and credible intervals 
sum <- summary(out, burnin=1000)

# Print the bayesQR.summary object
sum




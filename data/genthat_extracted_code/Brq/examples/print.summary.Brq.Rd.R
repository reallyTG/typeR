library(Brq)


### Name: print.summary.Brq
### Title: Print the summary of Bayesian quantile regression methods.
### Aliases: print.summary.Brq

### ** Examples

# Simulate data from heteroskedastic regression
set.seed(666)
n <- 100
x <- runif(n=n,min=0,max=10)
y <- 2 + 2*x + 0.6 *x*rnorm(n=n, mean=0, sd=1)

fit <- Brq(y ~ x, tau=0.5, method="Bqr") 

# Return Bayes estimates and credible intervals 
Results<- summary(fit)

# Print the Brq.summary object
Results




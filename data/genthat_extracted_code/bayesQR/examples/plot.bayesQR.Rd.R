library(bayesQR)


### Name: plot.bayesQR
### Title: Produce quantile plots or traceplots with 'plot.bayesQR'
### Aliases: plot.bayesQR

### ** Examples

# Simulate data from heteroskedastic regression
set.seed(66)
n <- 200
X <- runif(n=n,min=0,max=10)
X <- X
y <- 1 + 2*X + rnorm(n=n, mean=0, sd=.6*X)

# Analyze 5 quantiles using default prior
# NOTE: to limit execution time of the example, ndraw is set
#       to a very low value. Set value to 5000 for a better
#       approximation of the posterior distirubtion.
out <- bayesQR(y ~ X, quantile=c(.05,.25,.5,.75,.95), ndraw=500)

# Check traceplot of first variable of .75 quantile regression 
plot(out, var=1, quantile=.75, plottype="trace")

# Check posterior histogram of first variable of .5 quantile regression 
plot(out, var=1, quantile=.5, plottype="hist")

# Create default quantile plot of first variable
plot(out, var=1, plottype="quantile")

# Create quantile plot of second variable with 90% credible interval
plot(out, var="X", credint=c(.05, .95), plottype="quantile", main="This is an example")




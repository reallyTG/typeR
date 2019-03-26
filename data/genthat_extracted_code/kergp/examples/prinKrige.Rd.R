library(kergp)


### Name: prinKrige
### Title: Principal Kriging Functions
### Aliases: prinKrige

### ** Examples

library(kergp)
set.seed(314159)
n <- 100
x <- sort(runif(n))
y <- 2 + 4 * x  + 2 * x^2 + 3 * sin(6 * pi * x ) + 1.0 * rnorm(n)
nNew <- 60; xNew <- sort(runif(nNew))
df <- data.frame(x = x, y = y)

##-------------------------------------------------------------------------
## use a Matern 3/2 covariance and a mispecified trend. We should guess
## that it lacks a mainily linear and slightly quadratic part.
##-------------------------------------------------------------------------

myKern <- k1Matern3_2
inputNames(myKern) <- "x"
mygp <- gp(formula = y ~ sin(6 * pi * x),
           data = df, 
           parCovLower = c(0.01, 0.01), parCovUpper = c(10, 100),
           cov = myKern, estim = TRUE, noise = TRUE)
PK <- prinKrige(mygp)

## the third PKF suggests a possible linear trend term, and the
## fourth may suggest a possible quadratic linear trend

matplot(x, PK$vectors[ , 1:4], type = "l", lwd = 2)





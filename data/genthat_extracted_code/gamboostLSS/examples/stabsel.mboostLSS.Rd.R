library(gamboostLSS)


### Name: stabsel
### Title: Stability Selection
### Aliases: stabsel.mboostLSS selected.stabsel_mboostLSS
### Keywords: nonparametric

### ** Examples


### Data generating process:
set.seed(1907)
x1 <- rnorm(500)
x2 <- rnorm(500)
x3 <- rnorm(500)
x4 <- rnorm(500)
x5 <- rnorm(500)
x6 <- rnorm(500)
mu    <- exp(1.5 +1 * x1 +0.5 * x2 -0.5 * x3 -1 * x4)
sigma <- exp(-0.4 * x3 -0.2 * x4 +0.2 * x5 +0.4 * x6)
y <- numeric(500)
for( i in 1:500)
    y[i] <- rnbinom(1, size = sigma[i], mu = mu[i])
dat <- data.frame(x1, x2, x3, x4, x5, x6, y)

### linear model with y ~ . for both components: 400 boosting iterations
model <- glmboostLSS(y ~ ., families = NBinomialLSS(), data = dat,
                     control = boost_control(mstop = 400),
                     center = TRUE, method = "noncyclic")

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:

#run stability selection 
(s <- stabsel(model, q = 5, PFER = 1))
#get selected effects
selected(s)

#visualize selection frequencies 
plot(s)

### END (don't test automatically)
## End(No test)




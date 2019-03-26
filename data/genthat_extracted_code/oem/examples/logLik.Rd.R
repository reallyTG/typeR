library(oem)


### Name: logLik.oem
### Title: log likelihood function for fitted oem objects
### Aliases: logLik.oem logLik.cv.oem logLik.xval.oem

### ** Examples

set.seed(123)
n.obs <- 2000
n.vars <- 50

true.beta <- c(runif(15, -0.25, 0.25), rep(0, n.vars - 15))
x <- matrix(rnorm(n.obs * n.vars), n.obs, n.vars)
y <- rnorm(n.obs, sd = 3) + x %*% true.beta

fit <- oem(x = x, y = y, penalty = c("lasso", "mcp"), compute.loss = TRUE)

logLik(fit)

logLik(fit, which.model = "mcp")


fit <- cv.oem(x = x, y = y, penalty = c("lasso", "mcp"), compute.loss = TRUE,
              nlambda = 25)

logLik(fit)

logLik(fit, which.model = "mcp")


fit <- xval.oem(x = x, y = y, penalty = c("lasso", "mcp"), compute.loss = TRUE, 
                nlambda = 25)

logLik(fit)

logLik(fit, which.model = "mcp")





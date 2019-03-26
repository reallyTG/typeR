library(KFAS)


### Name: SSMarima
### Title: Create a State Space Model Object of Class SSModel
### Aliases: SSMarima SSMcustom SSMcycle SSModel SSMregression SSMseasonal
###   SSMtrend

### ** Examples

# add intercept to state equation by augmenting the state vector:
# diffuse initialization for the intercept, gets estimated like other states:
# for known fixed intercept, just set P1 = P1inf = 0 (default in SSMcustom).
intercept <- 0
model_int <- SSModel(Nile ~ SSMtrend(1, Q = 1469) +
SSMcustom(Z = 0, T = 1, Q = 0, a1 = intercept, P1inf = 1), H = 15099)

model_int$T
model_int$T[1, 2, 1] <- 1 # add the intercept value to level
out <- KFS(model_int)

# dynamic regression model

set.seed(1)
x1 <- rnorm(100)
x2 <- rnorm(100)
b1 <- 1 + cumsum(rnorm(100, sd = 1))
b2 <- 2 + cumsum(rnorm(100, sd = 0.1))
y <- 1 + b1 * x1 + b2 * x2 + rnorm(100, sd = 0.1)

model <- SSModel(y ~ SSMregression(~ x1 + x2, Q = diag(NA,2)), H = NA)

fit <- fitSSM(model, inits = c(0,0,0), method = "BFGS")

model <- fit$model
model$Q
model$H
out <- KFS(model)

ts.plot(out$alphahat[,-1], b1, b2, col = 1:4)


# example of using data argument
y <- x <- rep(1, 3)
data1 <- data.frame(x = rep(2, 3))
data2 <- data.frame(x = rep(3, 3))

f <- formula(~ -1 + x)
# With data missing the environment of formula is checked,
# and if not found in there a calling environment via parent.frame is checked.

c(SSModel(y ~ -1 + x)["Z"]) # 1
c(SSModel(y ~ -1 + x, data = data1)["Z"]) # 2

c(SSModel(y ~ -1 + SSMregression(~ -1 + x))["Z"]) # 1
c(SSModel(y ~ -1 + SSMregression(~ -1 + x, data = data1))["Z"]) # 2
c(SSModel(y ~ -1 + SSMregression(~ -1 + x), data = data1)["Z"]) # 2
SSModel(y ~ -1 + x + SSMregression(~ -1 + x, data = data1))["Z"] # 1 and 2
SSModel(y ~ -1 + x + SSMregression(~ -1 + x), data = data1)["Z"] # both are 2
SSModel(y ~ -1 + x + SSMregression(~ -1 + x, data = data1), data = data2)["Z"] # 3 and 2

SSModel(y ~ -1 + x + SSMregression(f))["Z"] # 1 and 1
SSModel(y ~ -1 + x + SSMregression(f), data = data1)["Z"] # 2 and 1
SSModel(y ~ -1 + x + SSMregression(f,data = data1))["Z"] # 1 and 2

rm(x)
c(SSModel(y ~ -1 + SSMregression(f, data = data1))$Z) # 2
## Not run: 
##D # This fails as there is no x in the environment of f
##D try(c(SSModel(y ~ -1 + SSMregression(f), data = data1)$Z))
## End(Not run)




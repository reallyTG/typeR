library(alpaca)


### Name: feglm
### Title: Efficiently fit glm's with high-dimensional k-way fixed effects
### Aliases: feglm

### ** Examples

## No test: 
# Generate artificial for logit models
library(alpaca)
data <- simGLM(1000L, 200L, 1805L, model = "logit")

# Fit 'feglm()'
mod <- feglm(y ~ x1 + x2 + x3 | i + t, data)
summary(mod)

# Recover estimates of fixed effects
alpha <- getFEs(mod)
## End(No test)




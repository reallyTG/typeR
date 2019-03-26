library(aurelius)


### Name: extract_params.glm
### Title: extract_params.glm
### Aliases: extract_params.glm

### ** Examples

X1 <- rnorm(100)
X2 <- runif(100)
Y <- 3 - 5 * X1 + 3 * X2 + rnorm(100, 0, 3)
Y <- Y > 0

glm_model <- glm(Y ~ X1 + X2, family = binomial(logit))
model_params <- extract_params(glm_model)




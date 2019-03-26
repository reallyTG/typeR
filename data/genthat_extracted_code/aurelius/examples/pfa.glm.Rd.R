library(aurelius)


### Name: pfa.glm
### Title: PFA Formatting of Fitted GLMs
### Aliases: pfa.glm

### ** Examples

X1 <- rnorm(100)
X2 <- runif(100)
Y <- 3 - 5 * X1 + 3 * X2 + rnorm(100, 0, 3)
Y <- Y > 0

glm_model <- glm(Y ~ X1 + X2, family = binomial(logit))
model_as_pfa <- pfa(glm_model)




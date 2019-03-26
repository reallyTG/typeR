library(partykit)


### Name: prune.modelparty
### Title: Post-Prune 'modelparty' Objects
### Aliases: prune.modelparty prune.lmtree

### ** Examples

set.seed(29)
n <- 1000
d <- data.frame(
  x = runif(n),
  z = runif(n),
  z_noise = factor(sample(1:3, size = n, replace = TRUE))
)
d$y <- rnorm(n, mean = d$x * c(-1, 1)[(d$z > 0.7) + 1], sd = 3)

## glm versus lm / logLik versus sum of squared residuals
fmla <- y ~ x | z + z_noise
lm_big <- lmtree(formula = fmla, data = d, maxdepth = 3, alpha = 1)
glm_big <- glmtree(formula = fmla, data = d, maxdepth = 3, alpha = 1)

AIC(lm_big)
AIC(glm_big)

## load rpart for prune() generic
## (otherwise: use prune.modelparty directly)
if (require("rpart")) {

## pruning
lm_aic <- prune(lm_big, type = "AIC")
lm_bic <- prune(lm_big, type = "BIC")

width(lm_big)
width(lm_aic)
width(lm_bic)

glm_aic <- prune(glm_big, type = "AIC")
glm_bic <- prune(glm_big, type = "BIC")

width(glm_big)
width(glm_aic)
width(glm_bic)

}




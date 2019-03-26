library(KFAS)


### Name: approxSSM
### Title: Linear Gaussian Approximation for Exponential Family State Space
###   Model
### Aliases: approxSSM

### ** Examples


# A Gamma example modified from ?glm (with log-link)
clotting <- data.frame(
  u = c(5,10,15,20,30,40,60,80,100),
  lot1 = c(118,58,42,35,27,25,21,19,18),
  lot2 = c(69,35,26,21,18,16,13,12,12))

glmfit1 <- glm(lot1 ~ log(u), data = clotting, family = Gamma(link = "log"))
glmfit2 <- glm(lot2 ~ log(u), data = clotting, family = Gamma(link = "log"))

# Model lot1 and lot2 together (they are still assumed independent)
# Note that Gamma distribution is parameterized by 1/dispersion i.e. shape parameter
model <- SSModel(cbind(lot1, lot2) ~ log(u),
                u = 1/c(summary(glmfit1)$dispersion, summary(glmfit2)$dispersion),
                data = clotting, distribution = "gamma")
approxmodel <- approxSSM(model)

# Conditional modes of linear predictor:
approxmodel$thetahat
cbind(glmfit1$linear.predictor, glmfit2$linear.predictor)

KFS(approxmodel)
summary(glmfit1)
summary(glmfit2)

# approxSSM uses modified step-halving for more robust convergence than glm:
y <- rep (0:1, c(15, 10))
suppressWarnings(glm(formula = y ~ 1, family = binomial(link = "logit"), start = 2))
model <- SSModel(y~1, dist = "binomial")
KFS(model, theta = 2)
KFS(model, theta = 7)




library(WeightIt)


### Name: method_user
### Title: User-Defined Functions for Estimating Weights
### Aliases: method_user

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

#A user-defined version of method = "ps"
my.ps <- function(treat, covs, estimand, focal = NULL) {
  covs <- make.full.rank(covs)
  d <- data.frame(treat, covs)
  f <- formula(d)
  ps <- glm(f, data = d, family = "binomial")$fitted
  if (estimand == "ATT") w <- ifelse(treat == focal, 1, ps/(1-ps))
  else if (estimand == "ATE") w <- ifelse(treat == 1, 1/ps, 1/(1-ps))

  return(list(w = w, ps = ps))
}

#Balancing covariates between treatment groups (binary)
(W1 <- weightit(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                method = my.ps, estimand = "ATT"))
summary(W1)
bal.tab(W1)

library("twang")
data("iptwExWide", package = "twang")
(W2 <- weightitMSM(list(tx1 ~ age + gender + use0,
                      tx2 ~ tx1 + use1 + age + gender + use0,
                      tx3 ~ tx2 + use2 + tx1 + use1 + age + gender + use0),
                 data = iptwExWide,
                 method = my.ps))
summary(W2)
bal.tab(W2)





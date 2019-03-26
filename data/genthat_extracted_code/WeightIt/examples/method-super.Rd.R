library(WeightIt)


### Name: method_super
### Title: Propensity Score Weighting Using SuperLearner
### Aliases: method_super

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

#Balancing covariates between treatment groups (binary)
(W1 <- weightit(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                method = "super", estimand = "ATT",
                SL.library = c("SL.glm", "SL.gam",
                               "SL.knn")))
summary(W1)
bal.tab(W1)

#Balancing covariates with respect to race (multinomial)
(W2 <- weightit(race ~ age + educ + married +
                nodegree + re74, data = lalonde,
                method = "super", estimand = "ATE",
                SL.library = c("SL.glm", "SL.gam",
                               "SL.knn")))
summary(W2)
bal.tab(W2)

#Balancing covariates with respect to re75 (continuous)
(W3 <- weightit(re75 ~ age + educ + married +
                nodegree + re74, data = lalonde,
                method = "super", use.kernel = TRUE,
                SL.library = c("SL.glm", "SL.gam",
                               "SL.ridge")))
summary(W3)
bal.tab(W3)




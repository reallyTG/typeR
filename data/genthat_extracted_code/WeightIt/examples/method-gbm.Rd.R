library(WeightIt)


### Name: method_gbm
### Title: Propensity Score Weighting Using Generalized Boosted Models
### Aliases: method_gbm

### ** Examples
## No test: 
library("cobalt")
data("lalonde", package = "cobalt")

#Balancing covariates between treatment groups (binary)
(W1 <- weightit(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                method = "gbm", estimand = "ATT",
                stop.method = "es.max"))
summary(W1)
bal.tab(W1)

#Balancing covariates with respect to race (multinomial)
(W2 <- weightit(race ~ age + educ + married +
                nodegree + re74, data = lalonde,
                method = "gbm", estimand = "ATE",
                stop.method = "ks.mean"))
summary(W2)
bal.tab(W2)

#Balancing covariates with respect to re75 (continuous)
(W3 <- weightit(re75 ~ age + educ + married +
                nodegree + re74, data = lalonde,
                method = "gbm", use.kernel = TRUE,
                stop.method = "p.max"))
summary(W3)
bal.tab(W3)
## End(No test)



library(cobalt)


### Name: bal.tab.weightit
### Title: Balance Statistics for WeightIt Objects
### Aliases: bal.tab.weightit bal.tab.weightitMSM

### ** Examples

library(WeightIt); data("lalonde", package = "cobalt")

## Basic propensity score weighting
w.out1 <- weightit(treat ~ age + educ + race + 
                  married + nodegree + re74 + re75, 
                  data = lalonde, method = "ps")
bal.tab(w.out1, un = TRUE, m.threshold = .1, 
        v.threshold = 2)

## Entropy balancing for the ATE
w.out2 <- weightit(treat ~ age + educ + race + 
                  married + nodegree + re74 + re75, 
                  data = lalonde, method = "entropy",
                  estimand = "ATE")
bal.tab(w.out2)




library(cobalt)


### Name: bal.tab.CBPS
### Title: Balance statistics for CBPS Objects
### Aliases: bal.tab.CBPS

### ** Examples

library(CBPS); data("lalonde", package = "cobalt")

## Using CBPS() for generating covariate balancing 
## propensity score weights
cbps.out <- CBPS(treat ~ age + educ + married + race +
             nodegree + re74 + re75, data = lalonde)
bal.tab(cbps.out)




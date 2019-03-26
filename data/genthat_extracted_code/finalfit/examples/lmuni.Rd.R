library(finalfit)


### Name: lmuni
### Title: Linear regression univariable models: 'finalfit' model wrapper
### Aliases: lmuni

### ** Examples

library(finalfit)
library(dplyr)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "nodes"

colon_s %>%
  lmuni(dependent, explanatory) %>%
  fit2df()





library(finalfit)


### Name: lmmulti
### Title: Linear regression multivariable models: 'finalfit' model wrapper
### Aliases: lmmulti

### ** Examples

library(finalfit)
library(dplyr)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "nodes"

colon_s %>%
  lmmulti(dependent, explanatory) %>%
  fit2df()





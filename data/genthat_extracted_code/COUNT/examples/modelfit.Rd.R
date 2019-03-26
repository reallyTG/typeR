library(COUNT)


### Name: modelfit
### Title: Fit Statistics for generalized linear models
### Aliases: modelfit
### Keywords: models

### ** Examples

## Hilbe (2011), Table 9.17
library(MASS)
data(lbwgrp)
nb9_3 <- glm.nb(lowbw ~ smoke + race2 + race3 + offset(log(cases)), data=lbwgrp)
summary(nb9_3)
exp(coef(nb9_3))
modelfit(nb9_3) 




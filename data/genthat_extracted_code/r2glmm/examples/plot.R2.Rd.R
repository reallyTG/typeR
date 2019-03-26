library(r2glmm)


### Name: plot.R2
### Title: Visualize standardized effect sizes and model R squared
### Aliases: plot.R2

### ** Examples

library(nlme)
library(r2glmm)

data(Orthodont)

# Linear mixed model
lmemod = lme(distance ~ age*Sex, random = ~1|Subject, data = Orthodont)

r2 = r2beta(model=lmemod,partial=TRUE,method='sgv')

plot(x=r2)




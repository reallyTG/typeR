library(r2glmm)


### Name: r2dt
### Title: R Squared Difference Test (R2DT). Test for a statistically
###   significant difference in generalized explained variance between two
###   candidate models.
### Aliases: r2dt

### ** Examples

library(nlme)
library(lme4)
library(r2glmm)

data(Orthodont)

# Comparing two linear mixed models
m1 = lmer(distance ~ age*Sex+(1|Subject), Orthodont)
m2 = lmer(distance ~ age*Sex+(1+age|Subject), Orthodont)

m1r2 = r2beta(model=m1,partial=FALSE)
m2r2 = r2beta(model=m2,partial=FALSE)

# Accounting for correlation can make a substantial difference.

r2dt(x=m1r2, y = m2r2, cor = TRUE)
r2dt(x=m1r2, y = m2r2, cor = FALSE)






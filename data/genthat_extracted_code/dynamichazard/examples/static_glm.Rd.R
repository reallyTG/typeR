library(dynamichazard)


### Name: static_glm
### Title: Static glm Fit
### Aliases: static_glm

### ** Examples

library(dynamichazard)
fit <- static_glm(
 Surv(time, status == 2) ~ log(bili), pbc, id = pbc$id, max_T = 3600,
 by = 50)
fit$coefficients






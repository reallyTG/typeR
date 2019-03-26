library(r2glmm)


### Name: pqlmer
### Title: pqlmer
### Aliases: pqlmer

### ** Examples

# Compare lmer PQL with lme PQL

library(MASS)

lmePQL = glmmPQL(y ~ trt + week + I(week > 2), random = ~ 1 | ID,
                  family = binomial, data = bacteria,
                  verbose = FALSE)

merPQL= pqlmer(y ~ trt + week + I(week > 2) + (1 | ID),
               family = binomial, data = bacteria,
               verbose = FALSE)

summary(lmePQL)
summary(merPQL)




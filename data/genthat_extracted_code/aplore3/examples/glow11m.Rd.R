library(aplore3)


### Name: glow11m
### Title: GLOW11M data
### Aliases: glow11m
### Keywords: datasets

### ** Examples

head(glow11m, n = 10)
summary(glow11m)

## Table 7.2 p. 252
library(survival)
mod7.2 <- clogit(as.numeric(fracture) ~ height + weight + bmi +
                 priorfrac + premeno + momfrac + armassist + raterisk +
                 strata(pair), data = glow11m)
summary(mod7.2)




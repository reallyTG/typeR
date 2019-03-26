library(mcglm)


### Name: Hunting
### Title: Hunting in Pico Basile, Bioko Island, Equatorial Guinea.
### Aliases: Hunting
### Keywords: datasets

### ** Examples

## No test: 
library(mcglm)
library(Matrix)
data(Hunting, package="mcglm")
formu <- OT ~ METHOD*ALT + SEX + ALT*poly(MONTH, 4)
Z0 <- mc_id(Hunting)
Z1 <- mc_mixed(~0 + HUNTER.MONTH, data = Hunting)
fit <- mcglm(linear_pred = c(formu), matrix_pred = list(c(Z0, Z1)),
            link = c("log"), variance = c("poisson_tweedie"),
            power_fixed = c(FALSE),
            control_algorithm = list(max_iter = 100),
            offset = list(log(Hunting$OFFSET)), data = Hunting)
summary(fit)
anova(fit)
## End(No test)




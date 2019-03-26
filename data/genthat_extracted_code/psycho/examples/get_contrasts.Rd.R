library(psycho)


### Name: get_contrasts
### Title: Compute estimated contrasts from models.
### Aliases: get_contrasts

### ** Examples

## Not run: 
##D library(psycho)
##D require(lmerTest)
##D require(rstanarm)
##D 
##D fit <- lm(Adjusting ~ Birth_Season * Salary, data = affective)
##D get_contrasts(fit)
##D 
##D fit <- lm(Adjusting ~ Birth_Season * Salary, data = affective)
##D get_contrasts(fit, adjust = "bonf")
##D 
##D fit <- lmerTest::lmer(Adjusting ~ Birth_Season * Salary + (1 | Salary), data = affective)
##D get_contrasts(fit, formula = "Birth_Season")
##D 
##D fit <- rstanarm::stan_glm(Adjusting ~ Birth_Season, data = affective)
##D get_contrasts(fit, formula = "Birth_Season", ROPE_bounds = c(-0.1, 0.1))
## End(Not run)




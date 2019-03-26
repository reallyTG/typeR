library(psycho)


### Name: get_means
### Title: Compute estimated means from models.
### Aliases: get_means

### ** Examples

## Not run: 
##D library(psycho)
##D require(lmerTest)
##D require(rstanarm)
##D 
##D 
##D fit <- glm(Sex ~ Birth_Season, data = affective, family = "binomial")
##D get_means(fit)
##D 
##D fit <- lmerTest::lmer(Adjusting ~ Birth_Season * Salary + (1 | Salary), data = affective)
##D get_means(fit, formula = "Birth_Season")
##D 
##D fit <- rstanarm::stan_glm(Adjusting ~ Birth_Season, data = affective)
##D get_means(fit, formula = "Birth_Season")
## End(Not run)




library(psycho)


### Name: standardize.lm
### Title: Standardize Coefficients.
### Aliases: standardize.lm

### ** Examples

## Not run: 
##D library(psycho)
##D 
##D df <- mtcars %>%
##D   mutate(cyl = as.factor(cyl))
##D 
##D fit <- lm(wt ~ mpg * cyl, data = df)
##D fit <- lmerTest::lmer(wt ~ mpg * cyl + (1 | gear), data = df)
##D 
##D summary(fit)
##D standardize(fit)
## End(Not run)





library(estimatr)


### Name: commarobust
### Title: Build lm_robust object from lm fit
### Aliases: commarobust

### ** Examples

lmo <- lm(mpg ~ hp, data = mtcars)

# Default HC2
commarobust(lmo)

commarobust(lmo, se_type = "HC3")

commarobust(lmo, se_type = "stata", clusters = mtcars$carb)





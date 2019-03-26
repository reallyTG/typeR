library(configural)


### Name: fungible.lm
### Title: Locate extrema of fungible OLS regression weights
### Aliases: fungible.lm

### ** Examples

lm_mtcars <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb,
                data = mtcars)
lm_mtcars_fung <- fungible(lm_mtcars, Nstarts = 100)




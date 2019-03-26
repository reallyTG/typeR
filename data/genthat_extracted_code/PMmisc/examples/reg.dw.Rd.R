library(PMmisc)


### Name: reg.dw
### Title: Durbin-Watson Test
### Aliases: reg.dw

### ** Examples

fit <- lm(mpg~wt, mtcars, na.action = na.omit)
reg.dw(fit)




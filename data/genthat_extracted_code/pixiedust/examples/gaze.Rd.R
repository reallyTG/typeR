library(pixiedust)


### Name: gaze
### Title: Mimic Stargazer Output to Display Multiple Models
### Aliases: gaze

### ** Examples

fit1 <- lm(mpg ~ qsec + am + wt + gear + factor(vs), data = mtcars)
fit2 <- lm(mpg ~ am + wt + gear + factor(vs), data = mtcars)

gaze(fit1, fit2)
gaze(with_qsec = fit1, 
     without_qsec = fit2)
gaze(fit1, fit2, include_glance = FALSE)
gaze(fit1, fit2, glance_vars = c("AIC", "BIC"))





library(nlme)


### Name: summary.lme
### Title: Summarize an lme Object
### Aliases: summary.lme print.summary.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
(s1 <- summary(fm1))
## Not run: coef(s1) # the (coef | Std.E | t | P-v ) matrix
## Don't show: 
stopifnot(is.matrix(coef(s1)))
## End(Don't show)




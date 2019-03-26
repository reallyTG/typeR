library(lme4)


### Name: merPredD-class
### Title: Class '"merPredD"' - a Dense Predictor Reference Class
### Aliases: merPredD-class
### Keywords: classes

### ** Examples

showClass("merPredD")
pp <- slot(lmer(Yield ~ 1|Batch, Dyestuff), "pp")
stopifnot(is(pp, "merPredD"))
str(pp) # an overview of all fields and methods' names.




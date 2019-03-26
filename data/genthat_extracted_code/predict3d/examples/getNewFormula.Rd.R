library(predict3d)


### Name: getNewFormula
### Title: Make new formula
### Aliases: getNewFormula

### ** Examples

fit=lm(mpg~factor(cyl)*factor(am)+wt+carb,data=mtcars)
getNewFormula(fit,predictors=c("am","wt"))




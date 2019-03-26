library(processR)


### Name: addCovarEquation
### Title: Add covariates to equation
### Aliases: addCovarEquation

### ** Examples

equation="M ~ X*W\nY ~ a1*M + C1*X"
covar=list(name=c("C1","C2","C3"),label=c("ese","sex","tenure"),site=list(c("M","Y"),"Y","Y"))
grouplabels=list(C1="e")
addCovarEquation(equation,covar=covar)




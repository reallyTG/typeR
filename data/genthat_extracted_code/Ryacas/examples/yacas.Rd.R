library(Ryacas)


### Name: yacas
### Title: yacas interface
### Aliases: yacas.character yacas.expression yacas.function yacas.formula
###   yacas.yacas yacas as.expression.yacas as.character.yacas addSemi
###   ynext ySequence ysub yparse yAssignFunction
### Keywords: symbolmath

### ** Examples

yacas(expression(Factor(x^2-1)))
exp1 <- expression(x^2 + 2 * x^2)
exp2 <- expression(2 * exp0)
exp3 <- expression(6 * pi * x)
exp4 <- expression((exp1 * (1 - sin(exp3))) / exp2)
print(yacas(exp4))

print(yacas("Version()")) # yacas version

# see demo("Ryacas-Function")






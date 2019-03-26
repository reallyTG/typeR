library(MuMIn)


### Name: Formula manipulation
### Title: Manipulate model formulas
### Aliases: simplify.formula expand.formula
### Keywords: manip

### ** Examples


simplify.formula(y ~ a + b + a:b + (c + b)^2)
simplify.formula(y ~ a + b + a:b + 0)

expand.formula(~ a * b)





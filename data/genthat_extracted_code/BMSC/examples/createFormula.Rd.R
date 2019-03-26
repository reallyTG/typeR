library(BMSC)


### Name: createFormula
### Title: Create a formula with interactions and polynomials up to a
###   desired order
### Aliases: createFormula

### ** Examples

createFormula("y ~ x1 + x2", 2, 3)
createFormula(as.formula("y ~ x1 + x2"), interactionDepth = 2)

carFormula <- createFormula("mpg ~ cyl + disp + drat", 2, 3)
summary(lm(carFormula, mtcars))




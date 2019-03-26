library(ivmte)


### Name: polyparse
### Title: Parsing marginal treatment response formulas
### Aliases: polyparse

### ** Examples

## Declare MTR functions
formula1 = ~ 1 + u
formula0 = ~ 1 + u

## Construct MTR polynomials
polynomials0 <- polyparse(formula = formula0,
                          data = dtm,
                          uname = u,
                          as.function = FALSE)

polynomials1 <- polyparse(formula = formula0,
                          data = dtm,
                          uname = u,
                          as.function = FALSE)
 




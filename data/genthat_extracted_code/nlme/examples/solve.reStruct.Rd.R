library(nlme)


### Name: solve.reStruct
### Title: Apply Solve to an reStruct Object
### Aliases: solve.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(list(A = pdSymm(diag(1:3), form = ~Score),
  B = pdDiag(2 * diag(4), form = ~Educ)))
solve(rs1)




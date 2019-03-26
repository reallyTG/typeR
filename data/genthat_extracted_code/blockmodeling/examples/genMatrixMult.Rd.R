library(blockmodeling)


### Name: genMatrixMult
### Title: Generalized matrix multiplication
### Aliases: genMatrixMult
### Keywords: array algebra

### ** Examples

# Operations can be anything
x <- matrix(letters[1:8], ncol = 2)
y <- matrix(1:10, nrow = 2)

genMatrixMult(x, y, FUNelement = paste,
FUNsummary = function(x) paste(x, collapse = "|"))

# Binary logic
set.seed(1)
x <- matrix(rbinom(8, size = 1, prob = 0.5) == 1, ncol = 2)
y <- matrix(rbinom(10, size = 1, prob = 0.5) == 1, nrow = 2)
genMatrixMult(x, y, FUNelement = "*", FUNsummary = any)




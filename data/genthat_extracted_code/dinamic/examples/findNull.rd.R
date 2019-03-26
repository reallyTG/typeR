library(dinamic)


### Name: findNull
### Title: Find DiNAMIC's Null Distribution
### Aliases: findNull
### Keywords: array arith

### ** Examples

random.seed = 12345
set.seed(random.seed)
x = matrix(rnorm(50), 5, 10)
num.perms = 10
example.null = findNull(x, num.perms, random.seed)
#round(example.null, 2) 
#Returns 5.50 4.93 5.84 5.01 4.11 4.54 3.72 4.13 4.12 6.59




library(CORElearn)


### Name: noEqualRows
### Title: Number of equal rows in two data sets
### Aliases: noEqualRows

### ** Examples

# uses two randomly generated data sets
set.seed(12345)
d1 <- classDataGen(100)
d2 <- classDataGen(100)
noEqualRows(d1, d2, tolerance=1e-4)




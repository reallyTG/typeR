library(saeRobust)


### Name: testMatX
### Title: Construction of test data
### Aliases: testMatX testResponse0 testResponse testRook

### ** Examples

## Examples from Weihs et. al. (2014) p. 108
library("Matrix")
testMatX(Matrix(998), Matrix(998))
Z <- Matrix(c(998, 0, 0, 0), 2, 2)
testMatX(Z, Z)
testResponse0(testMatX(Matrix(1)))
library("magrittr")
Matrix(1) %>% testMatX %>% testResponse0 %>% testResponse




library(sgee)


### Name: genCorMat
### Title: Correlation Matrix Generator.
### Aliases: genCorMat

### ** Examples



## Generates Correlation Matricies easily
## When corstr = "independence", the value of rho
## is irrelevant
mat1 <- genCorMat(corstr = "independence", rho = .1, maxClusterSize = 3) 

## Exchangeable
mat2 <- genCorMat(corstr = "exchangeable", rho = .3, maxClusterSize = 2) 

## AR-1
mat3 <- genCorMat(corstr = "ar1", rho = .4, maxClusterSize = 4) 

## unstructured
mat3 <- genCorMat(corstr = "unstructured",
                  rho = c(.3,.2,.1),
                  maxClusterSize = 3) 






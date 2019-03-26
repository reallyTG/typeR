library(SimilaR)


### Name: SimilaR_fromTwoFunctions
### Title: SimilaR_fromTwoFunctions
### Aliases: SimilaR_fromTwoFunctions

### ** Examples

f1 <- function(x) {x*x}
f2 <- function(x,y) {x+y}

## A dataframe is returned: 1 row, 4 columns
SimilaR_fromTwoFunctions(f1,
                         f2,
                         returnType = "data.frame",
                         aggregation = "tnorm")
                         
## A dataframe is returned: 1 row, 5 columns
SimilaR_fromTwoFunctions(f1,
                         f2,
                         returnType = "data.frame",
                         aggregation = "both")     
                         
## A not symmetric square matrix is returned, 
## with 2 rows and 2 columns
SimilaR_fromTwoFunctions(f1,
                         f2,
                         returnType = "matrix",
                         aggregation = "both")                     
                         




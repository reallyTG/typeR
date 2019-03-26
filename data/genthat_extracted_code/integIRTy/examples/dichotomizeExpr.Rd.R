library(integIRTy)


### Name: dichotomizeExpr
### Title: Dichotomize the expression data given both tumor and normal
###   samples.
### Aliases: dichotomizeExpr
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(OV)
binDat <- dichotomizeExpr(Expr_T[1:200, ], Expr_N[1:200, ])
#binDat <- dichotomizeExpr(Expr_T[1:200, ], Expr_N[1:200, ], parallel=TRUE)
binDat[15:20, 1:2]




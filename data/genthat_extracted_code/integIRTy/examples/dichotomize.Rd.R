library(integIRTy)


### Name: dichotomize
### Title: A wrapper that is able to dichotomize expression, methylation
###   and CN data
### Aliases: dichotomize
### Keywords: integIRTy

### ** Examples

data(OV)
binDat_expr <- dichotomize(Expr_T[1:20, ], Expr_N[1:20, ], assayType='Expr')
binDat_methy <- dichotomize(Methy_T[1:20, ], Methy_N[1:20, ], assayType='Methy')




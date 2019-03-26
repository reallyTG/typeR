library(integIRTy)


### Name: dichotomizeMethy
### Title: Dichotomize the methylation data given both tumor and normal
###   controls.
### Aliases: dichotomizeMethy
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(OV)
binDat <- dichotomizeMethy(Methy_T[1:200, ], Methy_N[1:200, ])
binDat[15:20, 1:2]




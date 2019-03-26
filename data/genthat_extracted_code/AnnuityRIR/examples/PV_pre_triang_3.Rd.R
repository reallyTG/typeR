library(AnnuityRIR)


### Name: PV_pre_triang_3
### Title: Compute the present value of an annuity-due considering only
###   non-central moments of negative orders. The calculation is performed
###   by using the function $triangular\_moments\_3$ for the moments
###   greater than -2 (in absolute value).
### Aliases: PV_pre_triang_3

### ** Examples


data=c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
PV_pre_triang_3(data,10)





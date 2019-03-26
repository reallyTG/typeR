library(AnnuityRIR)


### Name: PV_post_triang_dis
### Title: Compute the present value of an annuity-immediate considering
###   only non-central moments of negative orders. The calculation is
###   performed by using the moments of the fitted triangular distribution
###   of the random variable "capitalization factor" U (which are obtained
###   from the definition of negative moment of a continuous random
###   variable).
### Aliases: PV_post_triang_dis

### ** Examples


data=c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
PV_post_triang_dis(data,10)





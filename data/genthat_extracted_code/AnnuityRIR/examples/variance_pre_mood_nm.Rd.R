library(AnnuityRIR)


### Name: variance_pre_mood_nm
### Title: Compute the variance of the present value of an annuity-due
###   using the Mood _et al._ approximation and some non-central moments of
###   negative order.
### Aliases: variance_pre_mood_nm

### ** Examples


# example 1
data = c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
data=data/100
variance_pre_mood_nm(data)





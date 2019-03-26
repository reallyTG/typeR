library(AnnuityRIR)


### Name: variance_post_mood_pm
### Title: Compute the variance of the present value of an
###   annuity-immediate using the Mood _et al._ approximation and some
###   non-central moments of positive order.
### Aliases: variance_post_mood_pm

### ** Examples


# example 1
data = c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
data=data/100
variance_post_mood_pm(data)





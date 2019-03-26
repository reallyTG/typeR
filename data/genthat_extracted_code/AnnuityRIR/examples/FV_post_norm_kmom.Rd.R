library(AnnuityRIR)


### Name: FV_post_norm_kmom
### Title: Compute the final expected value of an n-payment annuity, with
###   payments of 1 unit each made at the end of every year
###   (annuity-immediate), valued at the rate X, using the estimated
###   moments of the normal distribution.
### Aliases: FV_post_norm_kmom

### ** Examples


# example 1
data = c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
data=data/100
FV_post_norm_kmom(data,8)


# example 1
data<-rnorm(n=200,m=0.075,sd=0.2)
norm_test_jb(data) #test data
FV_post_norm_kmom(data,8)






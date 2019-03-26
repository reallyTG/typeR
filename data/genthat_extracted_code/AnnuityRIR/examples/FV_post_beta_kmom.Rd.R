library(AnnuityRIR)


### Name: FV_post_beta_kmom
### Title: Compute the final expected value of an n-payment annuity, with
###   payments of 1 unit each made at the end of every year
###   (annuity-immediate), valued at the rate X, using the estimated
###   moments of the beta distribution.
### Aliases: FV_post_beta_kmom

### ** Examples


# example 1
data=c(0.00,-0.05,-0.05,-0.06,-0.06,0.02,-0.06,-0.05,-0.04,-0.05,
-0.03,-0.06,0.04,-0.05,-0.08,-0.05,-0.12,-0.03,-0.05,-0.04,-0.06)
FV_post_beta_kmom(data,8)

# example 2
data<-rnorm(n=200,m=0.075,sd=0.2)
FV_post_beta_kmom(data,8)






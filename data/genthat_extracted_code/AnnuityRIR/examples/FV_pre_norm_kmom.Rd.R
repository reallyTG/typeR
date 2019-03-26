library(AnnuityRIR)


### Name: FV_pre_norm_kmom
### Title: Compute the final expected value of an n-payment annuity, with
###   payments of 1 unit each made at the beginning of every year
###   (annuity-due), valued at the rate X, using the estimated moments of
###   the normal distribution.
### Aliases: FV_pre_norm_kmom

### ** Examples


# example 1
data<-rnorm(n=30,m=0.03,sd=0.01)
norm_test_jb(data) #test data
FV_pre_norm_kmom(data,8)

# example 1
data<-rnorm(n=200,m=0.075,sd=0.2)
norm_test_jb(data) #test data
FV_pre_norm_kmom(data,8)






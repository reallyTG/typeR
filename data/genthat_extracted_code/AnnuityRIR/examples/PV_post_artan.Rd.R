library(AnnuityRIR)


### Name: PV_post_artan
### Title: Compute present expected value of an n-payment annuity, with
###   payments of 1 unit each, made at the end of every year
###   (annuity-immediate), valued at the rate X, using the tetraparametric
###   function approach.
### Aliases: PV_post_artan

### ** Examples


#example 1
data=c(0.298,0.255,0.212,0.180,0.165,0.163,0.167,0.161,0.154,
0.128,0.079,0.059,0.042,-0.008,-0.012,-0.002)
PV_post_artan(data)

# example 2
data<-rnorm(n=30,m=0.03,sd=0.01)
PV_post_artan(data)

# example 3
data<-rnorm(n=30,m=0.03,sd=0.2)
PV_post_artan(data)





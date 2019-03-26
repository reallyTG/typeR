library(AnnuityRIR)


### Name: FV_pre_quad
### Title: Compute the final expected value of an n-payment annuity, with
###   payments of 1 unit each made at the beginning of every year
###   (annuity-due), valued at the rate X, using the quadratic discount
###   method.
### Aliases: FV_pre_quad

### ** Examples

#example 1
data=c(0.298,0.255,0.212,0.180,0.165,0.163,0.167,0.161,0.154,
0.128,0.079,0.059,0.042,-0.008,-0.012,-0.002)
FV_pre_quad(data,6)

# example 2
data<-rnorm(n=30,m=0.03,sd=0.01)
FV_pre_quad(data,10)




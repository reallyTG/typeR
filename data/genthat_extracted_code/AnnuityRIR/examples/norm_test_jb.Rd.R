library(AnnuityRIR)


### Name: norm_test_jb
### Title: Compute the Jarque-Bera test for checking the assumption of
###   normality of the interest rates distribution and returns the
###   parameters of the fitted normal distribution.
### Aliases: norm_test_jb

### ** Examples


#example 1
data=c(0.298,0.255,0.212,0.180,0.165,0.163,0.167,0.161,
0.154,0.128,0.079,0.059,0.042,-0.008,-0.012,-0.002)
norm_test_jb(data)

# example 2
data<-rnorm(n=30,m=0.03,sd=0.01)
norm_test_jb(data)

# example 3
data=runif(999, min = 0, max = 1)
norm_test_jb(data)

# example 4
data=c(0.00,-0.05,-0.05,-0.06,-0.06,0.02,-0.06,-0.05,-0.04,-0.05,
-0.03,-0.06,0.04,-0.05,-0.08,-0.05,-0.12,-0.03,-0.05,-0.04,-0.06)
norm_test_jb(data)




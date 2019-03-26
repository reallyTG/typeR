library(carcass)


### Name: ettersonEq14
### Title: Equation 14 of Etterson (2013) Ecological Applications 23,
###   1915-1925
### Aliases: ettersonEq14
### Keywords: methods misc

### ** Examples


# in case of regular search intervals, the calculations below give the same results
ettersonEq14(s=0.8, f=0.8, J=c(3,3,3,3,3))
pkorner(s=0.8, f=0.8, d=3, n=5)


 # in case of irregular search intervals the function ettersonEq14 is more appropriate
ettersonEq14(s=0.8, f=0.8, J=c(3,5,1,4,2))
pkorner(s=0.8, f=0.8, d=mean(c(3,5,1,4,2)), n=5)





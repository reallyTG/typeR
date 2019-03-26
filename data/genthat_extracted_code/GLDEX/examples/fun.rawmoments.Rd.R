library(GLDEX)


### Name: fun.rawmoments
### Title: Computes the raw moments of the generalised lambda distribution
###   up to 4th order.
### Aliases: fun.rawmoments
### Keywords: univar

### ** Examples


## Generate some random numbers using FMKL and RS generalised lambda 
## distributions and then compute the empirical and theoretical 
## E(X), E(X^2), E(X^3), E(X^4) 

junk<-rgl(100000,1,2,3,4)
mean(junk)
mean(junk^2)
mean(junk^3)
mean(junk^4)

junk<-rgl(100000,1,2,3,4,"rs")
mean(junk)
mean(junk^2)
mean(junk^3)
mean(junk^4)

fun.rawmoments(1,2,3,4)
fun.rawmoments(1,2,3,4,"rs")




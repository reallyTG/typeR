library(portes)


### Name: InvertQ
### Title: Check Stationary and Invertibility of ARMA or VARMA Models
### Aliases: InvertQ
### Keywords: ts

### ** Examples

##############################################################
### Check Stationary
phi <- array(c(0.5,0.4,0.1,0.5,0,0.3,0,0),dim=c(2,2,2))
InvertQ(phi)
### Check Invertibility
theta <- array(c(0.5,0.4,0.1,0.5,0,0.3,0,0),dim=c(2,2,2))
InvertQ(theta)




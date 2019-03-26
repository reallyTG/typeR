library(portes)


### Name: ImpulseVMA
### Title: The Impulse Response Function in the Infinite MA or VMA
###   Representation
### Aliases: ImpulseVMA
### Keywords: ts

### ** Examples

#####################################################################
### Impulse response coefficients from AR(1,1) to infinite MA process. 
### The infinite process is truncated at lag 20
###
k <- 1
trunc.lag <- 20
phi <- 0.7
theta <- array(-0.9,dim=c(k,k,1))
ImpulseVMA(phi,theta,trunc.lag)
#####################################################################
### Impulse response coefficients from VAR(2) to infinite VMA process
### The infinite process is truncated at default lag value = p+q
###
k <- 2
phi <- array(c(0.5,0.4,0.1,0.5,0,0.3,0,0),dim=c(k,k,2))
theta <- NULL
ImpulseVMA(phi,theta)
#####################################################################
### Impulse response coefficients from VARMA(2,1) to infinite VMA process
### The infinite process is truncated at lag 50
###
k <- 2
phi <- array(c(0.5,0.4,0.1,0.5,0,0.25,0,0),dim=c(k,k,2))
theta <- array(c(0.6,0,0.2,0.3),dim=c(k,k,1))
ImpulseVMA(phi,theta,trunc.lag=50)




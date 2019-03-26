library(ifultools)


### Name: mutilsSDF
### Title: SDF evaluation over a discrete uniform grid of frequencies
### Aliases: mutilsSDF
### Keywords: IO

### ** Examples

## create a faux SDF 
S <- function(f, phi)  1/(1 + phi^2 - 2*phi*cos(2*pi*f))

## specify additional input arguments needed to 
## evaluate the SDF 
sdfargs <- list(phi=0.9)

## evaluate the SDF over frequencies on the 
## interval [0, 1/2] 
Sx <- mutilsSDF(sdf=S, sdfargs=sdfargs)

## plot the result 
f <- attr(Sx,"frequency")
plot(f, Sx, type="l")




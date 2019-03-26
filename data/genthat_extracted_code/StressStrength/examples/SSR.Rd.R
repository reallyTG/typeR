library(StressStrength)


### Name: SSR
### Title: Computation of reliability of stress-strength models
### Aliases: SSR
### Keywords: distribution models

### ** Examples

# let X be a normal r.v. with mean 1 and sd 1;
# and Y a normal r.v. with mean 0 and sd 2
# X and Y independent
parx<-c(1, 1)
pary<-c(0, 2)
# reliability of the stress-strength model (X=strength, Y=stress)
SSR(parx,pary)
# changing the parameters of Y
pary<-c(1.5, 2)
# reliability of the stress-strength model (X=strength, Y=stress)
SSR(parx,pary)




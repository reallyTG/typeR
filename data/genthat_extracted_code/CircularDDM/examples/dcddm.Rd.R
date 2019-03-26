library(CircularDDM)


### Name: dcddm
### Title: The Circular Drift-diffusion Distribution
### Aliases: dcddm rcddm

### ** Examples

## dcddm example
x <- cbind(
RT= c(1.2595272, 0.8693937, 0.8009044, 1.0018933, 2.3640007, 1.0521304),
R = c(1.9217430, 1.7844653, 0.2662521, 2.1569724, 1.7277440, 0.8607271)
)
pVec <- c(a=2.45, vx=1.5, vy=1.25, t0=.1, s=1)
dcddm(x, pVec)

## rcddm example
pVec <- c(a=2, vx=1.5, vy=1.25, t0=.25, s=1)
den  <- rcddm(1e3, pVec);
hist(den[,1], breaks = "fd", xlab="Response Time",  main="Density")
hist(den[,3], breaks = "fd", xlab="Response Angle", main="Density")




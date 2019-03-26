library(metRology)


### Name: Mandel-Paule
### Title: Mandel-Paule calculation
### Aliases: mpaule mpaule.default mandel.paule
### Keywords: univar

### ** Examples

## the second example in the paper cited above
x <- c(201.533, 216.55)
s <- c(0.154, 0.25)
n <- c(6, 2)

mpaule(x, s/sqrt(n))

## Cd heat of vapourisation example from the paper cited above
x2<-c(27.044, 26.022, 26.340, 26.787, 26.796)
v<-c(3, 76, 464, 3, 14)*1e-3
mpaule(x2, sqrt(v))





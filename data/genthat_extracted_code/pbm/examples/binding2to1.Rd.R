library(pbm)


### Name: binding2to1
### Title: Generate a 2:1 Binding Curve
### Aliases: binding2to1
### Keywords: binding2to1

### ** Examples

time <- seq(1,2000)
curve <- binding2to1(time,1000,900e-9,10000,0.01,0.4,2000,0.0003,0.5)
plot(curve)




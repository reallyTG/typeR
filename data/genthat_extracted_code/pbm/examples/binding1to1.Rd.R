library(pbm)


### Name: binding1to1
### Title: Generate a 1:1 Binding Curve
### Aliases: binding1to1
### Keywords: binding1to1

### ** Examples

time <- seq(1,2000)
curve <- binding1to1(time,1000,6e-9,1000,0.01,0.6)
plot(curve)




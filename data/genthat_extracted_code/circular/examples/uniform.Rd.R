library(circular)


### Name: Circular Uniform
### Title: Circular Uniform Density Function
### Aliases: dcircularuniform rcircularuniform
### Keywords: distribution

### ** Examples


data1 <- rcircularuniform(100, control.circular=list(units="degrees"))
plot(data1)

curve.circular(dcircularuniform, join=TRUE, xlim=c(-1.2, 1.2), 
  ylim=c(-1.2, 1.2), main="Density of a Circular Uniform Distribution")




library(impimp)


### Name: impimp_event
### Title: Imprecise Events
### Aliases: impimp_event is.impimp_event
### Keywords: robust

### ** Examples

## underlying data set: x1: 1:6, x2: 1:10

## subspace, requiring: x1 == 1 & ((z2 == 1 ) | (z2 == 2))
impimp_event(x1 = 1, z2 = c(1,2))

## subsapce containing all points whitin the Cartesian
## product of (x1 =) {1,2,3,6} x {5,8} (= z2)
impimp_event(x1 = c(1:3,6), z2 = c(5,8))





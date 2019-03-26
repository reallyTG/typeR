library(OptHedging)


### Name: interpol1d
### Title: Linear interpolation function.
### Aliases: interpol1d interpolation1d
### Keywords: Linear interpolation

### ** Examples

F0 = c(1:10)
minS = 1;
maxS = 10;
out = interpol1d(2.45,F0,1,10)
out #since the function is the identity, the answer should be 2.45!




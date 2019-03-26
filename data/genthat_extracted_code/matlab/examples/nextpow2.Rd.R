library(matlab)


### Name: nextpow2
### Title: MATLAB nextpow2 function
### Aliases: nextpow2
### Keywords: arith

### ** Examples

nextpow2(10)                   # 4
nextpow2(1:10)                 # 0 1 2 2 3 3 3 3 4 4
nextpow2(-2^10)                # 10
nextpow2(.Machine$double.eps)  # -52
nextpow2(c(0.5, 0.25, 0.125))  # -1 -2 -3




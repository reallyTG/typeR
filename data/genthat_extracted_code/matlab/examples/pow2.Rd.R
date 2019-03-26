library(matlab)


### Name: pow2
### Title: MATLAB pow2 function
### Aliases: pow2
### Keywords: arith

### ** Examples

pow2(c(0, 1, 2, 3))               # 1 2 4 8
pow2(c(0, -1, 2, 3), c(0,1,-2,3)) # 0.0 -2.0  0.5 24.0
pow2(1i)                          # 0.7692389+0.6389613i

# For IEEE arithmetic...
pow2(1/2, 1)                      # 1
pow2(pi/4, 2)                     # pi
pow2(-3/4, 2)                     # -3
pow2(1/2, -51)                    # .Machine$double.eps
pow2(1/2, -1021)                  # .Machine$double.xmin




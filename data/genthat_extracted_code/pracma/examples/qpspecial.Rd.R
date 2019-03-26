library(pracma)


### Name: qpspecial
### Title: Special Quadratic Programming Solver
### Aliases: qpspecial

### ** Examples

G <- matrix(c(0.31, 0.99, 0.54, 0.20,
              0.56, 0.97, 0.40, 0.38,
              0.81, 0.06, 0.44, 0.80), 3, 4, byrow =TRUE)
qpspecial(G)
# $x
#              [,1]
# [1,] 1.383697e-07
# [2,] 5.221698e-09
# [3,] 8.648168e-01
# [4,] 1.351831e-01
# 
# $d
#           [,1]
# [1,] 0.4940377
# [2,] 0.3972964
# [3,] 0.4886660
# 
# $q
# [1] 0.6407121
# 
# $niter
# [1] 6
# 
# $info
# [1] 0




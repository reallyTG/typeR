library(dblcens)


### Name: d011
### Title: Compute NPMLE of CDF from doubly censored data
### Aliases: d011
### Keywords: survival nonparametric

### ** Examples

d011(z=c(1,2,3,4,5), d=c(1,0,2,2,1))
#
# you should get something like below (and more)
#
#       $time:
#       [1] 1.0 2.0 2.5 5.0    (notice the times, (3,4), corresponding
#                                   to d=2 are removed, and time 2.5 added
#       $status:               since there is a (0,2) pattern at
#       [1]  1  0 -1  1        times 2, 3. The status indicator of -1
#                                   show that it is an added time )
#       $surv
#       [1] 0.5000351 0.5000351 0.3333177 0.0000000
#
#       $jump
#       [1] 0.4999649 0.0000000 0.1667174 0.3333177
#
#       $exttime
#       [1] 1.0 2.0 2.5 3.0 4.0 5.0
#
#       $extstatus
#       [1]  1  0 -1  2  2  1
#
#       ...... 
#
#       $conv
#       [1] 3.300000e+01  8.788214e-06  ### did 33 iterations
#
# BTW, the true NPMLE of surv is (1/2, 1/2, 1/3, 0) at times (1,2,2.5,5).
###### Example 2. 
d011(c(1,2,3,4,5), c(1,2,1,0,1),influence.fun=TRUE)
#     we get
# ......
#$conv:
#[1] 3 0
#
#$Nodes:
#[1] 2 4
#
#$IC1tu:
#     [,1] [,2]
#[1,]   -1    0
#[2,]   -1   -2
#
#$IC2tu:
#           [,1] [,2]
#[1,]  0.0000000    0
#[2,] -0.3333333    0
#
#$IC3tu:
#     [,1]       [,2]
#[1,]   -1 -0.6666667
#[2,]   -1 -1.0000000
#
#$VarFt:
#[1] 0.24 0.24           ## est var of F(t) at t=nodes
#######################################################




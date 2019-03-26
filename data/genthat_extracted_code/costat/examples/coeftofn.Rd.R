library(costat)


### Name: coeftofn
### Title: Convert wavelet coefficients for two time-varying functions into
###   two functions with respect to time.
### Aliases: coeftofn
### Keywords: ts

### ** Examples

#
# Very artifical example
#
tmp.a <- c(1, -1)
tmp.b <- c(0.5, 0.5)
#
#
#
ans <- coeftofn(tmp.a, tmp.b)
#
# Print it out
#
ans
#Class 'csBiFunction' : Contains two sampled functions:
#       ~~~~  : List with 2 components with names
#              alpha beta 
#
#
#summary(.):
#----------
#Length of functions is:  256 




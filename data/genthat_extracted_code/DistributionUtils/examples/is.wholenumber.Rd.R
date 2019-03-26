library(DistributionUtils)


### Name: is.wholenumber
### Title: Is Object Numeric and Whole Numbers
### Aliases: is.wholenumber
### Keywords: classes

### ** Examples

is.wholenumber(-3:5)                           # TRUE
is.wholenumber(c(0,0.1,1.3,5))                 # FALSE
is.wholenumber(-3:5 + .Machine$double.eps)     # TRUE
is.wholenumber(-3:5 + .Machine$double.eps^0.5) # FALSE
is.wholenumber(c(2L,3L))                       # TRUE
is.wholenumber(c("2L","3L"))                   # FALSE
is.wholenumber(0i ^ (-3:3))                    # FALSE
is.wholenumber(matrix(1:6, nrow = 3))          # TRUE
is.wholenumber(list(-1:3,2:6))                 # FALSE
is.numeric(list(-1:3,2:6))                     # FALSE
is.wholenumber(unlist(list(-1:3,2:6)))         # TRUE




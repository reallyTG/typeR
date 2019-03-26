library(NCmisc)


### Name: extend.pc
### Title: Extend an interval by percentage
### Aliases: extend.pc

### ** Examples

extend.pc(c(2,10),0.25) # extend X symmetrically
extend.pc(c(2:10),0.25) # extend the range of X
# the following 3 examples extend X by 1% only in the 'positive' direction
extend.pc(c(25000,55000),.01,neg=FALSE) # standard positive extension
extend.pc(c(55000,25000),.01,neg=FALSE) # ranges in reverse order, not swapped
extend.pc(c(55000,25000),.01,neg=FALSE,swap=TRUE) # ranges in reverse order, swapped




library(wavethresh)


### Name: print.nv
### Title: Print a node vector object, also used by several other functions
###   to obtain packet list information
### Aliases: print.nv
### Keywords: print

### ** Examples

v <- rnorm(128)
vwst <- wst(v)
vnv <- MaNoVe(vwst)
print(vnv)
#Level :  6  Action is  R (getpacket Index:  1 )
#Level :  5  Action is  L (getpacket Index:  2 )
#Level :  4  Action is  L (getpacket Index:  4 )
#Level :  3  Action is  R (getpacket Index:  9 )
#Level :  2  Action is  L (getpacket Index:  18 )
#There are  6  reconstruction steps
#
# The L or R indicate whether to move to the left or the right basis function
# when descending the node tree
#
#




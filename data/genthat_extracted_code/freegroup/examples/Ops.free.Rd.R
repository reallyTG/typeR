library(freegroup)


### Name: Ops.free
### Title: Arithmetic Ops methods for the free group
### Aliases: Ops.free ops free_equal free_power free_repeat juxtapose
###   inverse inverse.free inverse.matrix

### ** Examples

x <- rfree(10,2)
y <- rfree(10,2)
z <- rfree(10,9)    # more complicated than x or y




x+y
x-y

x+y == y+x    # not equal in  general

x+as.free(0) == x     # always true
as.free(0)+x == x     # always true
x+(y+z)  == (x+y)+z   # always true
x*5 == x+x+x+x+x      # always true

x + alpha(26)

x^alpha(26)

x*12
x*(0:9)






library(deducorrect)


### Name: correctSigns
### Title: Correct sign errors and value interchanges in data records
### Aliases: correctSigns correctSigns.editmatrix correctSigns.editset

### ** Examples


# some data 
dat <- data.frame(
    x = c( 3,14,15,  1, 17,12.3),
    y = c(13,-4, 5,  2,  7, -2.1),
    z = c(10,10,-10, NA,10,10 ))
# ... which has to obey
E <- editmatrix(c("z == x-y"))

# All signs may be flipped, no swaps.

correctSigns(E, dat)

# Allow for rounding errors
correctSigns(E, dat, eps=2)

# Limit the number of combinations that may be tested 
correctSigns(E, dat, maxCombinations=2)

# fix z, flip everything else
correctSigns(E, dat,fixate="z")

# the same result is achieved with
correctSigns(E, dat, flip=c("x","y"))

# make x and y swappable, allow no flips
correctSigns(E, dat, flip=c(), swap=list(c("x","y")))

# make x and y swappable, swap a counts as one flip
correctSigns(E, dat, flip="z", swap=list(c("x","y")))

# same, but now, swapping is preferred (has lower weight)
correctSigns(E, dat, flip="z", swap=list(c("x","y")), weight=c(2,1))

# same, but now becayse x any y carry lower weight. Also allow for rounding errors
correctSigns(E, dat, flip="z", swap=list(c("x","y")), eps=2, weight=c(x=1, y=1, z=3))

# demand that solution has y>0
E <- editmatrix(c("z==x-y", "y>0"))
correctSigns(E,dat)

# demand that solution has y>0, taking acount of roundings in equalities
correctSigns(E,dat,eps=2)

# example with editset
E <- editset(expression(
    x + y == z,
    x >= 0,
    y > 0,
    y < 2,
    z > 1,
    z < 3,
    A %in% c('a','b'),
    B %in% c('c','d'),
    if ( A == 'a' ) B == 'b',
    if ( B == 'b' ) x < 1
))

x <- data.frame(
    x = -1,
    y = 1,
    z = 2,
    A = 'a',
    B = 'b'
)

correctSigns(E,x)



   
   




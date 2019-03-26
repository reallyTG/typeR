library(dvmisc)


### Name: inside
### Title: Check Whether Numeric Value Falls Inside Two Other Numeric
###   Values
### Aliases: inside

### ** Examples

# Check whether 2 is inside [0, 2.5]
inside(1, c(0, 2.5))

# Check whether 2 and 3 are inside (0, 3)
inside(c(2, 3), c(0, 3), inclusive = FALSE)

# Check whether 1 is inside [1, 2] and [3, 4]
inside(1, rbind(c(1, 2), c(3, 4)))





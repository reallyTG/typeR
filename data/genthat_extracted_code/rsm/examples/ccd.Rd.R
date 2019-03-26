library(rsm)


### Name: ccd
### Title: Generate central-composite designs and associated building
###   blocks
### Aliases: cube star dupe foldover ccd
### Keywords: design

### ** Examples

library(rsm)

### Generate a standard 3-variable first-order design with 8 corner points and 4 center points
( FOdes <- cube (3, n0 = 4, coding = list (
                x1 ~ (Temp - 150)/10, x2 ~ (Pres - 50)/5, x3 ~ Feedrate - 4)) )
                                    
### Add an orthodonal star block with 12 runs to create a second-order CCD
( SOdes <- djoin(FOdes, star(n0=6)) )

### Same as above, except make the whole CCD at once; and make it rotatable
### and inscribed so that no coded value exceeds 1
SOdes2 <- ccd (3, n0 = c(4,6), alpha = "rotatable", inscribed = TRUE, coding = list (
                x1 ~ (Temp - 150)/10, x2 ~ (Pres - 50)/5, x3 ~ Feedrate - 4))

### Make two replicate blocks of FOdes (2nd one randomized differently)
djoin(FOdes, dupe(FOdes))

### Fractional blocking illustration (with no center points)
# Basic design (bid = 1 ---> block generators b1 = -1, b2 = -1)
block1 <- cube (~ x1 + x2 + x3 + x4,  generators = x5 ~ x1 * x2 * x3 * x4,
                n0 = 0, blockgen = ~ c(x1 * x2, x1 * x3), bid = 1)
block1                

# The foldover (on all variables) of block1, in the same order
foldover(block1, randomize=FALSE)

# The 4th fractional block:
( block4 <- foldover(block1, bid = 4) )





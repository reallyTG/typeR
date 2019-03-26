library(deducorrect)


### Name: deducorrect-package
### Title: Deductive correction methods for sign, rounding and typing
###   errors
### Aliases: deducorrect-package

### ** Examples


require(editrules)

# some data 
dat <- data.frame(
    x = c( 3, 14, 15),
    y = c(13, -4,  5),
    z = c(10, 10,-10))

dat
# ... which has to obey
E <- editmatrix("z == x-y")


# All signs may be flipped, no swaps.
 correctSigns(E, dat)

correctTypos(E, dat)

correctRounding(E, dat)




library(Directional)


### Name: Check visually whether matrix Fisher samples is correctly generated or not
### Title: Check visually whether matrix Fisher samples is correctly
###   generated or not.
### Aliases: visual.check

### ** Examples

Fa <- matrix( c(85, 11, 41, 78, 39, 60, 43, 64, 48), ncol = 3) / 10
x <- rmatrixfisher(1000, Fa)
a <- visual.check(x, Fa)




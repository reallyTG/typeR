library(nonparaeff)


### Name: direc.dea
### Title: Linear Programming for the Directional Distance Function with
###   Undesirable Outputs
### Aliases: direc.dea
### Keywords: Data Envelopment Analysis

### ** Examples

## Simple Example of one input, one good output, and one bad output.
my.dat <- data.frame(yg = c(2, 5, 7, 8, 3, 4, 6),
                     yb = c(1, 2, 4, 7, 4, 5, 6),
                     x = c(1, 1, 1, 1, 1, 1, 1))
direc.dea(my.dat, ngood = 1, nbad = 1)




library(paleomorph)


### Name: plotSpecimens
### Title: Plot an array of specimen landmark data in an interactive 3D
###   frame
### Aliases: plotSpecimens

### ** Examples

A <- array(rep(rnorm(3 * 20, sd = 30), by = 6) + rnorm(6 * 20 * 3), 
       dim = c(20, 3, 6))
plotSpecimens(A)

plotSpecimens(A, bySpecimen = FALSE)

plotSpecimens(A, cols = grey(seq(0, 1, length.out = 6)))

plotSpecimens(A, l1 = c(1:4), planeOptions = list(alpha = 0.4, color = 'red'))






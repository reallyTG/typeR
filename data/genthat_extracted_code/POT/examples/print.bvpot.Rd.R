library(POT)


### Name: print.bvpot
### Title: Printing bvpot objects
### Aliases: print.bvpot
### Keywords: print

### ** Examples

set.seed(123)
x <- rgpd(500, 0, 1, 0.2)
y <- rgpd(500, 2, 0.5, -0.1)
Mlog <- fitbvgpd(cbind(x, y), c(0, 2))
Mlog




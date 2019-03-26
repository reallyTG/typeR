library(Gifi)


### Name: knotsGifi
### Title: Utility function for Gifi knot specifications.
### Aliases: knotsGifi
### Keywords: utilities

### ** Examples

ABC6 <- ABC[,6:11]
knotsGifi(ABC6, "Q")      ## tercile knots
knotsGifi(ABC6, "Q", 4)   ## quartile knots
knotsGifi(ABC6, "R")      ## 3 equally spaced interior knots
knotsGifi(ABC6, "E")      ## no interior knots
knotsGifi(ABC6, "D")      ## knots at the data points




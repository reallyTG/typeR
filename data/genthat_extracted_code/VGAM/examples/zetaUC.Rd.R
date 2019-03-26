library(VGAM)


### Name: Zeta
### Title: The Zeta Distribution
### Aliases: Zeta dzeta pzeta qzeta rzeta
### Keywords: distribution

### ** Examples

dzeta(1:20, shape = 2)
myshape <- 0.5
max(abs(pzeta(1:200, myshape) -
    cumsum(1/(1:200)^(1+myshape)) / zeta(myshape+1)))  # Should be 0

## Not run: 
##D  plot(1:6, dzeta(1:6, 2), type = "h", las = 1,
##D                col = "orange", ylab = "Probability",
##D      main = "zeta probability function; orange: shape = 2; blue: shape = 1")
##D points(0.10 + 1:6, dzeta(1:6, 1), type = "h", col = "blue") 
## End(Not run)




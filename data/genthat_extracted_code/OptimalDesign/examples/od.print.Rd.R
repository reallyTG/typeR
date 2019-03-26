library(OptimalDesign)


### Name: od.print
### Title: Print of a design
### Aliases: od.print

### ** Examples

# Print the uniform approximate design on 24 design points in [0, 2*pi].
w1 <- rep(1/24, 24); od.print(w1, seq(0, (46 / 24)* pi, length=24))

# Print an approximate design on 24 design points in [0, 2*pi] 
# with 8 support points.
w2 <- rep(c(1/8, 0, 0), 8); 
      od.print(w2, seq(0, (46 / 24)* pi, length=24))

# Print an approximate design on 24 design points in [0, 2*pi] 
# with 3 support points.
w3 <- rep(c(1/3, rep(0,7)), 3); 
      od.print(w3, seq(0, (46 / 24)* pi, length=24))

# For the trigonometric model of the first degree on the "full circle" 
# discretized to 24 equispaced points, all three designs have the same 
# information matrix:
F.trig <- F.cube(~I(cos(x1)) + I(sin(x1)), 0, (46 / 24)* pi, 24)
round(od.infmat(F.trig, w1), 6)
round(od.infmat(F.trig, w2), 6)
round(od.infmat(F.trig, w3), 6)




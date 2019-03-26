library(OptimalDesign)


### Name: od.plot
### Title: Plot of a design
### Aliases: od.plot

### ** Examples

# Plot of a uniform design on a discretized line segment.
od.plot(rep(1/21, 21), seq(-1, 1, by=0.1), "Discrete uniform design")

# Plot of a non-uniform simplex lattice design.
F <-  F.simplex(~x1 + x2 + x3 + I(x1*x2) + I(x1*x3) + I(x2*x3) - 1, 3, 4)
od.plot(c(4, 1, 1, 4, 1, 2, 1, 1, 1, 4), F[,c(1, 2, 3)], 
        "Non-uniform simplex lattice design")

# Plot of a Hadamard design on the cube.
F <- F.cube(~x1 + x2 + x3 - 1, rep(-1, 3), rep(1, 3), rep(11, 3))
w <- rep(0, 11^3); w[c(1, 121, 11^3-10, 11^3-110)] <- 1
od.plot(w, F, "Hadamard design (standard view)")
U <- qr.Q(qr(matrix(rnorm(9), ncol=3)))
od.plot(w, F %*% U, "Hadamard design (randomly rotated view)")




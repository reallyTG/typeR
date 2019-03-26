library(gMOIP)


### Name: integerPoints
### Title: Integer points inside the feasible region (Ax<=b).
### Aliases: integerPoints

### ** Examples

# Define the LP max/min coeff*x st. Ax<=b, x>=0
A <- matrix(c(9,10,2,4,-3,2), ncol = 2, byrow = TRUE)
b <- c(90,27,3)
coeff <- c(7.75, 10)

# Corner points of the polytope
cPoints<-cornerPoints(A, b)
# Integer points in the polytope
iPoints<-integerPoints(A, b)

# Plot of the polytope
plotPolytope(cPoints)
plotPolytope(points = cPoints)
plotPolytope(points = iPoints)
plotPolytope(cPoints, cPoints, iso = coeff, crit = "max")
plotPolytope(cPoints, iPoints, iso = coeff, crit = "max")
plotPolytope(cPoints, iPoints, showLbl = TRUE)
plotPolytope(cPoints, iPoints, iso = c(3,-3), crit = "min")
plotPolytope(cPoints, iPoints) + xlab("x") + ylab("y")

# Plot of criterion points given a bi-objective vector
zPoints<-criterionPoints(iPoints, c1 = c(coeff[1], 0), c2 = c(0, coeff[2]), crit = "max")
head(zPoints)
plotCriterion(zPoints)
plotCriterion(zPoints, addHull = FALSE, addTriangles = TRUE)
# mimimize
zPoints<-criterionPoints(zPoints, c1 = c(-1, 1), c2 = c(1, -1), crit = "min")
plotCriterion(zPoints, addHull = TRUE, addTriangles = TRUE, crit = "min")
# identify solutions (x1,x2) corresponding to (z1,z2)
plotPolytope(cPoints, zPoints, showLbl = TRUE)
plotCriterion(zPoints, addHull = TRUE, addTriangles = TRUE, crit = "min", showLbl = TRUE)
# max and min
zPoints<-criterionPoints(iPoints, c1 = c(-2, -1), c2 = c(1, 4), crit = "max")
plotPolytope(cPoints, zPoints, showLbl = TRUE, shape = zPoints$nD)
plotCriterion(zPoints, addHull = TRUE, addTriangles = TRUE, crit = "max", showLbl = TRUE)
zPoints<-criterionPoints(iPoints, c1 = c(-2, -1), c2 = c(1, 4), crit = "min")
plotCriterion(zPoints, addHull = TRUE, addTriangles = TRUE, crit = "min", showLbl = TRUE)

## Not run: 
##D # Generate tikz file for LaTeX
##D library(tikzDevice)
##D tikz(file = "plot_polytope.tex", standAlone=F, width = 7, height = 6)
##D plotPolytope(cPoints, zPoints, showLbl = TRUE)
##D dev.off()
## End(Not run)





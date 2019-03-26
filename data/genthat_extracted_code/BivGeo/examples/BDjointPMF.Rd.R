library(BivGeo)


### Name: BDjointPMF
### Title: Joint Probability Mass Function for the Basu-Dhar Bivariate
###   Geometric Distribution
### Aliases: BDjointPMF dbdbivgeo1 dbdbivgeo2

### ** Examples


# If x and y are integer numbers:

dbdbivgeo1(1, 2, c(0.2, 0.4, 0.7), log = FALSE)
# [1] 0.16128
dbdbivgeo2(1, 2, c(0.2, 0.4, 0.7), log = FALSE)
# [1] 0.16128

# If x is a matrix:

matr 	<- 	 matrix(c(1,2,3,5), ncol = 2)

dbdbivgeo1(matr, y = NULL, c(0.2,0.4,0.7))
# [1] 0.0451584000 0.0007080837
dbdbivgeo2(matr, y = NULL, c(0.2,0.4,0.7))
# [1] 0.0451584000 0.0007080837

# If log = TRUE:

dbdbivgeo1(1, 2, c(0.2, 0.4, 0.7), log = TRUE)
# [1] -1.824613
dbdbivgeo2(1, 2, c(0.2, 0.4, 0.7), log = TRUE)
# [1] -1.824613





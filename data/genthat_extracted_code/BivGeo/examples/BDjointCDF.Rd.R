library(BivGeo)


### Name: BDjointCDF
### Title: Joint Cumulative Function for the Basu-Dhar Bivariate Geometric
###   Distribution
### Aliases: BDjointCDF pbdbivgeo

### ** Examples


# If x and y are integer numbers:

pbdbivgeo(1, 2, c(0.2, 0.4, 0.7), lower.tail = TRUE)
# [1] 0.79728

# If x is a matrix:

matr 	<- 	 matrix(c(1,2,3,5), ncol = 2)
pbdbivgeo(matr, y = NULL, c(0.2,0.4,0.7), lower.tail = TRUE)
# [1] 0.8424384 0.9787478

# If lower.tail = FALSE:

pbdbivgeo(1, 2, c(0.2, 0.4, 0.7), lower.tail = FALSE)
# [1] 0.01568

matr 	<- 	 matrix(c(1,2,3,5), ncol = 2)
pbdbivgeo(matr, y = NULL, c(0.2,0.4,0.7), lower.tail = FALSE)
# [1] 4.390400e-03 6.884147e-05





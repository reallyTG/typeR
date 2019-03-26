library(BivGeo)


### Name: BDjointSFcure
### Title: Joint Survival Function for the Basu-Dhar Bivariate Geometric
###   Distribution in Presence of Cure Fraction
### Aliases: BDjointSFcure sbdbivgeocure

### ** Examples


# If lower.tail = FALSE:

sbdbivgeocure(1, 2, c(0.2, 0.4, 0.7), c(0.2, 0.3, 0.3, 0.2), lower.tail = FALSE)
# [1] 0.268656

matr 	<- 	 matrix(c(1,2,3,5), ncol = 2)
sbdbivgeocure(matr, y = NULL, c(0.2,0.4,0.7), c(0.2, 0.3, 0.3, 0.2), lower.tail = FALSE)
# [1] 0.2494637 0.2064101

# If lower.tail = TRUE:

sbdbivgeocure(1, 2, c(0.2, 0.4, 0.7), c(0.2, 0.3, 0.3, 0.2), lower.tail = TRUE)
# [1] 0.159456

matr 	<- 	 matrix(c(1,2,3,5), ncol = 2)
sbdbivgeocure(matr, y = NULL, c(0.2,0.4,0.7), c(0.2, 0.3, 0.3, 0.2), lower.tail = TRUE)
# [1] 0.1684877 0.1957496





library(sscor)


### Name: Shape2SSCM
### Title: Calculation of the Spatial Sign Covariance Matrix
### Aliases: Shape2SSCM

### ** Examples


# defining a shape matrix with trace 1
V <- matrix(c(1,0.8,-0.2,0.8,1,0,-0.2,0,1),ncol=3)/3
V

# calculating the related SSCM
SSCM <- Shape2SSCM(V)

# recalculate the shape based on the SSCM
V2 <- SSCM2Shape(SSCM)
V2

# error is negligible
sum(abs(V-V2))




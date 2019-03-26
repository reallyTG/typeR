library(sscor)


### Name: SSCM2Shape
### Title: Calculation of the shape matrix
### Aliases: SSCM2Shape

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




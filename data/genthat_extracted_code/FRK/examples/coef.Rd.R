library(FRK)


### Name: coef
### Title: Retrieve estimated regression coefficients
### Aliases: coef coef,SRE-method coef, SRE-method

### ** Examples

library(sp)
simdata <- SpatialPointsDataFrame(
               coords = matrix(runif(100), 50, 2),
                data = data.frame(z = rnorm(50)))
BAUs <- BAUs_from_points(SpatialPoints(simdata))
BAUs$fs <- 1
S <- SRE(f = z ~ 1 + coords.x1,
         basis = local_basis(plane()),
         BAUs = BAUs,
         data = list(simdata))
est_reg_coeff <- coef(S)




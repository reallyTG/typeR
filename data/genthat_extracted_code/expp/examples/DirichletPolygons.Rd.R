library(expp)


### Name: DirichletPolygons
### Title: Dirichlet Polygons
### Aliases: DirichletPolygons
###   DirichletPolygons,SpatialPointsBreeding,missing-method
###   DirichletPolygons,SpatialPointsBreeding,integer-method
###   DirichletPolygons,SpatialPointsBreeding,SpatialPolygons-method

### ** Examples


d = data.frame(
  x = c(4, 17, 16, 41, 41, 43, 86, 62, 71, 92, 95,53, 34, 27, 53), 
  y = c(3, 18, 36, 6, 18, 50, 3, 21, 40, 43, 57, 62, 62, 45, 37), 
  id = 1:15,male = paste0('m', 1:15), female = paste0('f', 1:15), 
    stringsAsFactors=FALSE)

b = SpatialPointsBreeding(d, id = 'id', breeding = ~ male + female)  

# boundary is inferred based on the Ripley-Rasson estimate of the spatial domain
dp1 = DirichletPolygons(b)
plot(dp1)

# boundary is given
brdy2 = rgeos::readWKT("POLYGON((28 71,67 68,70 49,84 49,90 74,111 65,107 
                      36,78 28,98 15,98 -4,74 -7,-2 -8,0 31,28 71) )")
dp2 = DirichletPolygons(b, boundary = brdy2)
plot(dp2)

# boundary is inferred based on the boundary id-s. 
# define boundary id-s using a 'Follow-The-Dots' strategy. 
brdy3 = as.integer(c(1, 2, 4, 7, 9, 10, 11, 12, 13, 14, 3))

dp3 = DirichletPolygons(b, boundary = brdy3)
plot(dp3)

# setting width manually
dp4 = DirichletPolygons(b, boundary = brdy3, width = 2)
plot(dp4)


plot(dp1)
plot(dp2, add = TRUE, border = 2)
plot(dp3, add = TRUE, border = 3)
plot(dp4, add = TRUE, border = 4)
plot(b, add = TRUE)






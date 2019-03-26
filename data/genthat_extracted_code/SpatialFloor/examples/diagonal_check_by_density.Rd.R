library(SpatialFloor)


### Name: diagonal_check_by_density
### Title: Generate a spatial layout of checks by diagonal design
### Aliases: diagonal_check_by_density

### ** Examples

#Creat a 30 by 30 layout with 0.2 density
tmp = diagonal_check_by_density(30, 30, 0.2)
fields::quilt.plot(tmp, nx=30, ny=30)




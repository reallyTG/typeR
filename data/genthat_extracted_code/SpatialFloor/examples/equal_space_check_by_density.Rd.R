library(SpatialFloor)


### Name: equal_space_check_by_density
### Title: Generate a spatial layout of checks by density
### Aliases: equal_space_check_by_density

### ** Examples

# To produce a 4 by 5 field with check distributed by density=0.2
nr = 4; nc = 5
example.tmp = equal_space_check_by_density(nr, nc, .2)
fields::quilt.plot(example.tmp, nx=nr, ny=nc)




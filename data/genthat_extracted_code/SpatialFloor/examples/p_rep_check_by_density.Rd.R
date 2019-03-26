library(SpatialFloor)


### Name: p_rep_check_by_density
### Title: Generate a spatial layout of checks by density: p rep design
###   with checks
### Aliases: p_rep_check_by_density

### ** Examples

# To produce a 20 by 20 field with check distributed by density=0.35
nr = 20; nc = 20
example.tmp = p_rep_check_by_density(nr, nc, by.density=.35)
fields::quilt.plot(example.tmp, nx=nr, ny=nc)




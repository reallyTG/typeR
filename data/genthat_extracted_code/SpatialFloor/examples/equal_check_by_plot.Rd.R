library(SpatialFloor)


### Name: equal_check_by_plot
### Title: Generate a spatial layout of checks by every # of plots
### Aliases: equal_check_by_plot

### ** Examples

# To produce a 4 by 5 field with check distributed by every 2 plots
nr = 4; nc = 5
example.tmp = equal_check_by_plot(nr, nc, 2)
fields::quilt.plot(example.tmp, nx=nr, ny=nc)




library(ggRandomForests)


### Name: quantile_pts
### Title: Find points evenly distributed along the vectors values.
### Aliases: quantile_pts

### ** Examples

## Not run: 
##D data(rfsrc_Boston)
##D 
##D # To create 6 intervals, we want 7 points. 
##D # quantile_pts will find balanced intervals 
##D rm_pts <- quantile_pts(rfsrc_Boston$xvar$rm, groups=6, intervals=TRUE)
##D 
##D # Use cut to create the intervals
##D rm_grp <- cut(rfsrc_Boston$xvar$rm, breaks=rm_pts)
##D 
##D summary(rm_grp)
## End(Not run)




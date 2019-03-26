library(hypervolume)


### Name: hypervolume_holes
### Title: Hole detection
### Aliases: hypervolume_holes

### ** Examples

## Not run: 
##D # generate annulus data
##D data_annulus <- data.frame(matrix(data=runif(4000),ncol=2))
##D names(data_annulus) <- c("x","y")
##D data_annulus  <- subset(data_annulus, 
##D sqrt((x-0.5)^2+(y-0.5)^2) > 0.4 & sqrt((x-0.5)^2+(y-0.5)^2) < 0.5)
##D 
##D # MAKE HYPERVOLUME (low reps for fast execution)
##D hv_annulus <- hypervolume_gaussian(data_annulus,
##D                 kde.bandwidth=0.05,name='annulus',samples.per.point=1)
##D 
##D # GET CONVEX EXPECTATION
##D hv_convex <- expectation_convex(hypervolume_thin(hv_annulus,num.samples=500),
##D                 check.memory=FALSE,use.random=TRUE)
##D 
##D # DETECT HOLES (low npoints for fast execution)
##D features_annulus <- hypervolume_holes(
##D                       hv.obs=hv_annulus, 
##D                       hv.exp=hv_convex,
##D                       set.check.memory=FALSE)
##D 
##D # CLEAN UP RESULTS
##D features_segmented <- hypervolume_segment(features_annulus, 
##D                         check.memory=FALSE,distance.factor=2)
##D features_segmented_pruned <- hypervolume_prune(features_segmented, 
##D                                 volume.min=0.02)
##D 
##D # PLOT RETAINED HOLE(S)
##D plot(hypervolume_join(hv_annulus, features_segmented_pruned))
## End(Not run)




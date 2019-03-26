library(phylin)


### Name: krig
### Title: Simple and ordinary kriging.
### Aliases: krig
### Keywords: interpolation kriging

### ** Examples

data(vipers)
data(d.gen)
data(grid)

# In this example we want to create the probable distribution of a 
# lineage based on the genetic distance. We need a vector defining if
# each sample belongs or not to the lineage
lin <- as.integer(vipers$lin == 1)

# create a distance matrix between samples
r.dist <- dist(vipers[,1:2])

# fit a model with defaults (spherical model) and estimation of range
gv <- gen.variogram(r.dist, d.gen)
gv <- gv.model(gv)

# perform interpolation with ordinary kriging
int.krig <- krig(lin, vipers[,1:2], grid, gv)

#plot the interpolation results
grid.image(int.krig, grid, main='Kriging with genetic distances',
           xlab='Longitude', ylab='Latitude', 
           sclab='Lineage interpolation')
points(vipers[,1:2], pch=lin+1)

# plot the interpolation standard variance
grid.image(int.krig, grid, ic='sd', 
           main='Kriging with genetic distances',
           xlab='Longitude', ylab='Latitude', 
           sclab='Standard deviation')
points(vipers[,1:2], pch=lin+1)

#plot only pixels higher than 0.95
lin.krig <- as.integer(int.krig$Z>0.95)
grid.image(lin.krig, grid, main='Kriging with genetic distances',
           xlab='Longitude', ylab='Latitude', sclab='Lineage')
points(vipers[,1:2], pch=lin+1)

## Not run: 
##D #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
##D # The following code is an example to combine the possible clusters   #
##D #  of a tree in a single map. It samples the tree at different length #
##D # and combines the probabilities.                                     #
##D #                                                                     #
##D #                NOTE: it may take some time to run!                  #
##D #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
##D 
##D # A phylogenetic tree is sampled at different lengths. An appropriate  
##D # package (e.g. ape) should be used to process the tree. To avoid extra
##D # dependencies we convert the genetic distances to an hclust.
##D 
##D hc <- hclust(as.dist(d.gen))
##D hs = seq(0.01, 0.08, 0.005) # tree length sampling
##D 
##D # Another options for tree sampling can be using the nodes position, 
##D # avoiding the root and tip levels:
##D # hs <- hc$height[hc$height > 0.0 & hc$height < max(hc$height)]
##D #
##D # Or a single threshold:
##D # hs <- 0.06
##D 
##D contact = rep(0, nrow(grid)) # Sums all probabilities
##D for (h in hs) {
##D     lins <- cutree(hc, h=h)
##D     print(paste("height =", h, ":", max(lins), "lineages")) #keep track
##D     ct = rep(1, nrow(grid)) # Product of individual cluster/lineage map
##D     for (i in unique(lins)) {
##D         lin <- as.integer(lins == i)
##D         krg <- krig(lin, vipers[,1:2], grid, gv, 
##D                     clamp = TRUE, verbose=FALSE)
##D         # Probability of NOT belonging to a cluster.
##D         ct <- ct * (1 - krg$Z) # Probab. of NOT belonging to a cluster
##D     }
##D     contact = contact + ct
##D }
##D krg$Z <- contact / length(hs) # Recycle krg with contact zones
##D 
##D #plot the interpolation results
##D grid.image(krg, grid, xlab='Longitude', ylab='Latitude', 
##D            main='Uncertainty in cluster classification / contact zones')
##D points(vipers[,1:2], pch=16, cex=0.5)
## End(Not run)




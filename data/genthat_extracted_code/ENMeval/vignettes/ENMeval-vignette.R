## ----setup, echo = FALSE, include=FALSE----------------------------------
library(knitr)
knitr::opts_chunk$set(collapse=TRUE, message=FALSE, warning=FALSE, comment="#>")

## ----occDownload---------------------------------------------------------
if (!require('spocc')) install.packages('spocc', repos="http://cran.us.r-project.org")
if (!require('ENMeval')) install.packages('ENMeval', repos="http://cran.us.r-project.org")

library(spocc)
library(ENMeval)

# Search GBIF for occurrence data.
bv <- occ('Bradypus variegatus', 'gbif', limit=300, has_coords=TRUE)

# Get the latitude/coordinates for each locality. Also convert the tibble that occ() outputs
# to a data frame for compatibility with ENMeval functions.
occs <- as.data.frame(bv$gbif$data$Bradypus_variegatus[,2:3])

# Remove duplicate rows (Note that you may or may not want to do this).
occs <- occs[!duplicated(occs),]

## ----envDownload, warning=FALSE, message=FALSE, fig.width = 5, fig.height = 5----
library(raster)

# First, load some predictor rasters from the dismo folder:
files <- list.files(path=paste(system.file(package='dismo'), '/ex', sep=''), pattern='grd', full.names=TRUE)

# Put the rasters into a RasterStack:
envs <- stack(files)

# Plot first raster in the stack, bio1
plot(envs[[1]], main=names(envs)[1])

# Add points for all the occurrence points onto the raster
points(occs)

# There are some points all the way to the south-east, far from all others. Let's say we know that this represents a subpopulation that we don't want to include, and want to remove these points from the analysis. We can find them by first sorting the occs table by latitude.
head(occs[order(occs$latitude),])

# We see there are two such points, and we can find them by specifying a logical statement that says to find all records with latitude less than -20.
index <- which(occs$latitude < (-20))

# Next, let's subset our dataset to remove them by using the negative assignment on the index vector.
occs <- occs[-index,]

# Let's plot our new points over the old ones to see what a good job we did.
points(occs, col='red')

## ----backgExt, message=FALSE---------------------------------------------
library(sp)

# Make a SpatialPoints object
occs.sp <- SpatialPoints(occs)

# Get the bounding box of the points
bb <- bbox(occs.sp)

# Add 5 degrees to each bound by stretching each bound by 10, as the resolution is 0.5 degree.
bb.buf <- extent(bb[1]-10, bb[3]+10, bb[2]-10, bb[4]+10)

# Crop environmental layers to match the study extent
envs.backg <- crop(envs, bb.buf)

## ----removeCaribbean, message=FALSE, fig.width = 5, fig.height = 5-------
if (!require('maptools')) install.packages('maptools', repos="http://cran.us.r-project.org")
if (!require('rgeos')) install.packages('rgeos', repos="http://cran.us.r-project.org")
library(maptools)
library(rgeos)

# Get a simple world countries polygon
data(wrld_simpl)

# Get polygons for Central and South America
ca.sa <- wrld_simpl[wrld_simpl@data$SUBREGION==5 | wrld_simpl@data$SUBREGION==13,]

# Both spatial objects have the same geographic coordinate system with slightly different specifications, so just name the coordinate reference system (crs) for ca.sa with that of
# envs.backg to ensure smooth geoprocessing.
crs(envs.backg) <- crs(ca.sa)

# Mask envs by this polygon after buffering a bit to make sure not to lose coastline.
ca.sa <- gBuffer(ca.sa, width=1)
envs.backg <- mask(envs.backg, ca.sa)

# Let's check our work. We should see Central and South America without the Carribbean.
plot(envs.backg[[1]], main=names(envs.backg)[1])
points(occs)

## ----backgPts, fig.width = 5, fig.height = 5-----------------------------
library(dismo)

# Randomly sample 10,000 background points from one background extent raster (only one per cell without replacement). Note: Since the raster has <10,000 pixels, you'll get a warning and all pixels will be used for background. We will be sampling from the biome variable because it is missing some grid cells, and we are trying to avoid getting background points with NA.
bg <- randomPoints(envs.backg[[9]], n=10000)
bg <- as.data.frame(bg)

# Notice how we have pretty good coverage (every cell).
plot(envs.backg[[1]], legend=FALSE)
points(bg, col='red')

## ----part.block, fig.width = 5, fig.height = 5---------------------------
blocks <- get.block(occs, bg)
str(blocks)

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(occs, pch=21, bg=blocks$occ.grp)

## ----part.ck1, fig.width = 5, fig.height = 5-----------------------------
check1 <- get.checkerboard1(occs, envs, bg, aggregation.factor=5)

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(occs, pch=21, bg=check1$occ.grp)

# The partitioning method is more clearly illustrated by looking at the background points:
points(bg, pch=21, bg=check1$bg.grp)

# We can change the aggregation factor to better illustrate how this partitioning method works:
check1.large <- get.checkerboard1(occs, envs, bg, aggregation.factor=30)
plot(envs.backg[[1]], col='gray', legend=FALSE)
points(bg, pch=21, bg=check1.large$bg.grp)
points(occs, pch=21, bg=check1.large$occ.grp, col='white', cex=1.5)

## ----part.ck2, fig.width = 5, fig.height = 5-----------------------------
check2 <- get.checkerboard2(occs, envs, bg, aggregation.factor=c(5,5))

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(bg, pch=21, bg=check2$bg.grp)
points(occs, pch=21, bg=check2$occ.grp, col='white', cex=1.5)

## ----part.jk, fig.width = 5, fig.height = 5------------------------------
jack <- get.jackknife(occs, bg)

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(occs, pch=21, bg=jack$occ.grp)  # note that colors are repeated here

## ----part.rand, fig.width = 5, fig.height = 5----------------------------
random <- get.randomkfold(occs, bg, k=5)

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(occs, pch=21, bg=random$occ.grp)

## ----part.user1, fig.width = 5, fig.height = 5---------------------------
ngrps <- 10
kmeans <- kmeans(occs, ngrps)
occ.grp <- kmeans$cluster

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(occs, pch=21, bg=occ.grp)

## ----part.user2, fig.width = 5, fig.height = 5---------------------------
bg.grp <- rep(0, nrow(bg))

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(bg, pch=16, bg=bg.grp)

## ----part.user3, fig.width = 5, fig.height = 5---------------------------
centers <- kmeans$center
d <- pointDistance(bg, centers, lonlat=T)
bg.grp <- apply(d, 1, function(x) which(x==min(x)))

plot(envs.backg[[1]], col='gray', legend=FALSE)
points(bg, pch=21, bg=bg.grp)

## ----load_vignette_data, echo = FALSE------------------------------------
data(eval2)

## ----enmeval1a, eval=FALSE-----------------------------------------------
#  eval1 <- ENMevaluate(occs, envs, bg, method='checkerboard2', RMvalues=c(1,2), fc=c('L'), algorithm='maxent.jar')

## ----enmeval1b, eval=FALSE-----------------------------------------------
#  eval2 <- ENMevaluate(occ=occs, env=envs, bg.coords=bg, method='checkerboard2', RMvalues=c(1,2), fc=c('L','LQ','LQP'), algorithm='maxent.jar')

## ----enmeval2par, eval=FALSE---------------------------------------------
#  eval2.par <- ENMevaluate(occs, envs, bg, method='checkerboard2', RMvalues=c(1,2), fc=c('L','LQ','LQP'), parallel=TRUE, algorithm='maxent.jar')

## ----enmeval3, eval=FALSE------------------------------------------------
#  eval3 <- ENMevaluate(occs, envs, bg, method='checkerboard2', RMvalues=c(1,2), fc=c('L','LQ','LQP'), rasterPreds=FALSE, algorithm='maxent.jar')

## ----enmeval4, results='hide'--------------------------------------------
overlap <- calc.niche.overlap(eval2@predictions, stat='D')

## ----enmeval5------------------------------------------------------------
overlap

## ----stuff---------------------------------------------------------------
eval2

str(eval2, max.level=3)

## ----stuff1--------------------------------------------------------------
eval2@algorithm

## ----stuff2--------------------------------------------------------------
eval2@results

eval2@results[which(eval2@results$delta.AICc==0),]

## ----stuff3--------------------------------------------------------------
eval2@predictions

## ----stuff4, fig.width = 5, fig.height = 5-------------------------------
plot(eval2@predictions[[which(eval2@results$delta.AICc==0)]], main="Relative occurrence rate")

## ----mod.obj1------------------------------------------------------------
aic.opt <- eval2@models[[which(eval2@results$delta.AICc==0)]]

aic.opt

## ----mod.obj3------------------------------------------------------------
aic.opt@results

## ----mod.obj4------------------------------------------------------------
var.importance(aic.opt)

## ----mod.obj2------------------------------------------------------------
aic.opt@lambdas

## ----mod.obj5------------------------------------------------------------
eval2@partition.method

## ----plot.res, fig.width = 5, fig.height = 5-----------------------------
eval.plot(eval2@results)

## ----plot.res2, fig.width = 5, fig.height = 5----------------------------
eval.plot(eval2@results, 'Mean.AUC', var='Var.AUC')

## ----plot.res3, fig.width = 5, fig.height = 5----------------------------
df <- var.importance(aic.opt)
barplot(df$permutation.importance, names.arg=df$variable, las=2, ylab="Permutation Importance")

## ----plot.pred1, fig.width = 5, fig.height = 5, mar=c(2,2,1,0)-----------
plot(eval2@predictions[[1]], legend=F)

# Now add the occurrence and background points, colored by evaluation bins:
points(eval2@bg.pts, pch=3, col=eval2@bg.grp, cex=0.5)
points(eval2@occ.pts, pch=21, bg=eval2@occ.grp)

## ----plot.pred2, fig.width = 5, fig.height = 2.5-------------------------
# bisect the plotting area to make two columns
par(mfrow=c(1,2), mar=c(2,2,1,0))

plot(eval2@predictions[['L_2']], ylim=c(-30,20), xlim=c(-90,-40), legend=F, main='L_2 prediction')

plot(eval2@predictions[['LQP_1']], ylim=c(-30,20), xlim=c(-90,-40), legend=F, main='LQP_1 prediction')

## ----response_curves, eval=FALSE-----------------------------------------
#    response(eval2@models[[1]])


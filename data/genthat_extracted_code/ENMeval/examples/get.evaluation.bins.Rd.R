library(ENMeval)


### Name: get.evaluation.bins 
### Title: Methods to partition data for evaluation
### Aliases: get.evaluation.bins get.block get.checkerboard1
###   get.checkerboard2 get.randomkfold get.user get.jackknife

### ** Examples

require(raster)

set.seed(1)

### Create environmental extent (raster) 
env <- raster(matrix(nrow=25, ncol=25))

### Create presence localities
set.seed(1)
nocc <- 25
xocc <- rnorm(nocc, sd=0.25) + 0.5
yocc <- runif(nocc, 0, 1)
occ.pts <- as.data.frame(cbind(xocc, yocc))

### Create background points
nbg <- 500
xbg <- runif(nbg, 0, 1)
ybg <- runif(nbg, 0, 1)
bg.pts <- as.data.frame(cbind(xbg, ybg))

### Show points
plot(env)
points(bg.pts)
points(occ.pts, pch=21, bg=2)

### Block partitioning method
blk.pts <- get.block(occ.pts, bg.pts)
plot(env)
points(occ.pts, pch=23, bg=blk.pts$occ.grp)
plot(env)
points(bg.pts, pch=21, bg=blk.pts$bg.grp)

### Checkerboard1 partitioning method
chk1.pts <- get.checkerboard1(occ.pts, env, bg.pts, 4)
plot(env)
points(occ.pts, pch=23, bg=chk1.pts$occ.grp)
plot(env)
points(bg.pts, pch=21, bg=chk1.pts$bg.grp)

### Checkerboard2 partitioning method
chk2.pts <- get.checkerboard2(occ.pts, env, bg.pts, c(2,2))
plot(env)
points(occ.pts, pch=23, bg=chk2.pts$occ.grp)
plot(env)
points(bg.pts, pch=21, bg=chk2.pts$bg.grp)

### Random k-fold partitions
# Note that k random does not partition the background
krandom.pts <- get.randomkfold(occ.pts, bg.pts, 4)
plot(env)
points(occ.pts, pch=23, bg=krandom.pts$occ.grp)
plot(env)
points(bg.pts, pch=21, bg=krandom.pts$bg.grp)

### k-1 jackknife partitions
# Note background is not partitioned
jack.pts <- get.jackknife(occ.pts, bg.pts)
plot(env)
points(occ.pts, pch=23, bg=rainbow(length(jack.pts$occ.grp)))
plot(env)
points(bg.pts, pch=21, bg=jack.pts$bg.grp)

### User-defined partitions
# Note background is not partitioned
occ.grp <- c(rep(1, 10), rep(2, 5), rep(3, 10))
bg.grp <- c(rep(1, 200), rep(2, 100), rep(3, 200))
user.pts <- get.user(occ.grp, bg.grp)
plot(env)
points(occ.pts, pch=23, bg=user.pts$occ.grp)
plot(env)
points(bg.pts, pch=21, bg=user.pts$bg.grp)





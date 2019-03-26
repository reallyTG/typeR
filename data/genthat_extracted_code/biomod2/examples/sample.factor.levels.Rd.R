library(biomod2)


### Name: sample.factor.levels
### Title: Tool to ensure the sampling of all levels of a factorial
###   variable
### Aliases: sample.factor.levels

### ** Examples

## example with raster* object ---------- 
## create a factorial raster
r1 <- raster()
r1[] <- 1; r1[1] <- 2; r1[2:3] <- 3
r1 <- as.factor(r1)
## create a continuous raster
r2 <- raster()
r2[] <- rnorm(ncell(r2))
## pull the raster into a RasterStack
stk <- stack(r1, r2)
is.factor(stk)

## define a mask for already sampled points
mask.out <- r1
mask.out[] <- NA; mask.out[2:3] <- 1

## define a list of mask where we want to sample in priority
mask.in.1 <- mask.in.2 <- r1
mask.in.1[1:10] <- NA ## only level 1 should be sampled in this mask
mask.in.2[1] <- NA ## only levels 1 and 3 should be sampled in this mask
mask.in <- list(mask.in.1 = mask.in.1, 
                mask.in.2 = mask.in.2)

## test different version of the function
sample.factor.levels(stk, mask.out = mask.out)
sample.factor.levels(stk, mask.in = mask.in)
sample.factor.levels(stk, mask.out = mask.out, mask.in = mask.in)





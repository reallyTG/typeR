library(SiMRiv)


### Name: simulate
### Title: Simulate movements in river networks, homogeneous, or
###   heterogeneous landscapes
### Aliases: simulate
### Keywords: simulation

### ** Examples

library(SiMRiv)

## A classic: simple random walk (Brownian motion) (Turchin 1998)
## i.e. single-state uncorrelated movement in an homogeneous landscape
######################################################################

## a single state, other parameters set to defaults

rand.walker <- species(state.RW())
sim <- simulate(rand.walker, 10000)
plot(sim, type="l", asp=1)

## two random walkers
#####################

sim <- simulate(list(rand.walker, rand.walker), 10000)
plot(sim[,1:2], type="l", asp=1, xlim=range(sim), ylim=range(sim), col=2)
lines(sim[,4:5], col=3)

## Another classic: Levy walk-like movement (e.g. Sims et al. 2008)
## i.e. two-state movement: composition of small-scale random walks
## with bursts of longer, correlated random walks
###################################################################

LevyWalker <- species(
    state.RW() + state.CRW(0.99),
    transitionMatrix(0.005, 0.02))
    
sim <- simulate(LevyWalker, 10000)
plot(sim, type="l", asp=1)

## Linear habitats, e.g. fish in a river network
################################################

## load sample river raster in a fish's perspective,
## i.e. resistance is 0 within the river, 1 otherwise.

data(river)

## let's try a Levy-like movement in a river network
## note: perceptual range radii and step lengths must be
## adequate to the raster resolution!

LevyWalker <- species(list(
    state(0, perceptualRange("cir", 100), 10, "RandomWalk")
    ,state(0.97, perceptualRange("cir", 500), 20, "CorrelatedRW")
), transitionMatrix(0.005, 0.001))

## NOTE: the following lines do exactly the same as above, but
## using the more convenient arithmetic operator shortcuts

LevyWalker <- species(
	(state.RW() * 100 + 10) + (state.CRW(0.97) * 500 + 20)
, transitionMatrix(0.005, 0.001))

sim <- simulate(LevyWalker, 20000, resist = river
    , coords = c(280635, 505236))

## plot movement; we use a high-res TIFF so that it
## can be viewed in detail

tiff("movement.tif", wid=5000, hei=5000, comp="lzw")
par(mar = c(0, 0, 0, 0))
plot(river, asp = 1, col = gray(seq(1, 0.5, len = 2))
    , ylim = range(sim[,2]), xlim = range(sim[,1]), axes = FALSE)
lines(sim, lwd = 2, col = "#0000ffcc")
dev.off()

## if we want the kernel density overlaid,
## uncomment these and put before dev.off()
# library(ks)
# d <- kde(sim[,1:2])
# plot(d, disp = "image", add=TRUE
#    , col = rgb(1, 0, 0, seq(0, 1, len = 15)))




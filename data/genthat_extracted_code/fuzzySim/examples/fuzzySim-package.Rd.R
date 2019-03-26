library(fuzzySim)


### Name: fuzzySim-package
### Title: Fuzzy Similarity in Species Distributions
### Aliases: fuzzySim-package fuzzySim
### Keywords: package

### ** Examples

data(rotifers)

head(rotifers)


# add column with species name abbreviations:

rotifers$spcode <- spCodes(rotifers$species, sep.species = "_", 
nchar.gen = 1, nchar.sp = 5, nchar.ssp = 0)

head(rotifers)


# convert species list (long format) to presence-absence table 
# (wide format):

rotifers.presabs <- splist2presabs(rotifers, sites.col = "TDWG4",
sp.col = "spcode", keep.n = FALSE)

head(rotifers.presabs)


# get 3rd-degree spatial trend surface for some species distributions:

data(rotif.env)

names(rotif.env)

rotifers.tsa <- multTSA(rotif.env, sp.cols = 18:20,
coord.cols = c("Longitude", "Latitude"), id.col = 1)

head(rotifers.tsa)


# get inverse squared distance to presence for each species:

rotifers.isqd <- distPres(rotif.env, sp.cols = 18:20,
coord.cols = c("Longitude", "Latitude"), id.col = 1, p = 2, inv = TRUE)

head(rotifers.isqd)


# get prevalence-independent environmental favourability models 
# for each species:

data(rotif.env)

names(rotif.env)

rotifers.fav <- multGLM(data = rotif.env, sp.cols = 18:20, 
var.cols = 5:17, id.col = 1, step = FALSE, trim = TRUE, 
Favourability = TRUE)


# get matrix of fuzzy similarity between species distributions:

# either based on inverse squared distance to presence:
rot.fuz.sim.mat <- simMat(rotifers.isqd[ , -1], method = "Jaccard")

# or on environmental favourability for presence:
rot.fuz.sim.mat <- simMat(rotifers.fav$predictions[ , 5:7], 
method = "Jaccard")

head(rot.fuz.sim.mat)


# transpose fuzzy rotifer distribution data to compare
# regional species composition rather than species' distributions:

names(rotifers.isqd)

rot.fuz.reg <- transpose(rotifers.fav$predictions, sp.cols = 5:7,
reg.names = 1)

head(rot.fuz.reg)


# get matrix of fuzzy similarity between (some) regions' 
# species compositions:

reg.fuz.sim.mat <- simMat(rot.fuz.reg[ , 1:10], method = "Jaccard")

head(reg.fuz.sim.mat)




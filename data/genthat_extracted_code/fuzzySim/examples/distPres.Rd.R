library(fuzzySim)


### Name: distPres
### Title: (Inverse) distance to the nearest presence
### Aliases: distPres
### Keywords: spatial models

### ** Examples

data(rotif.env)

head(rotif.env)

names(rotif.env)


# calculate plain distance to presence:

rotifers.dist <- distPres(rotif.env, sp.cols = 18:47, 
coord.cols = c("Longitude", "Latitude"), id.col = 1, p = 1, 
inv = FALSE, suffix = "_D")

head(rotifers.dist)


# calculate inverse squared distance to presence:

rotifers.invd2 <- distPres(rotif.env, sp.cols = 18:47, 
coord.cols = c("Longitude", "Latitude"), id.col = 1, p = 2, 
inv = TRUE, suffix = "_iDsq")

head(rotifers.invd2)




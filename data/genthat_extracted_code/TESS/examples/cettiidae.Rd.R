library(TESS)


### Name: cettiidae
### Title: Cettiidae phylogeny from Alstroem et al. (2011)
### Aliases: cettiidae
### Keywords: datasets

### ** Examples

# load the data
data(cettiidae)

# safe the old plotting settings
op <- par()

# set the new plotting settings
par(cex = 0.3)

# plot the phylogeny
plot(cettiidae)

# restore the plotting settings
par(op)




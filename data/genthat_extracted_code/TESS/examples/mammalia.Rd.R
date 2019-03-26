library(TESS)


### Name: mammalia
### Title: Dated family level mammalian phylogeny from Meredith et al.
###   (2011): Impacts of the cretaceous terrestrial revolution and kpg
###   extinction on mammal diversification.
### Aliases: mammalia
### Keywords: datasets

### ** Examples

# load the data
data(mammalia)

# safe the current settings of the plotting device
op <- par()

# set the line width for drawing thinner lines for the branches
par(cex = 0.3)

# plot the mammalian phylogeny
plot(mammalia)

# restore the settings of the device
par(op)




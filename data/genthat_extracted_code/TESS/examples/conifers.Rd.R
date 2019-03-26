library(TESS)


### Name: conifers
### Title: Conifer phylogeny from Leslie et al. (2012)
### Aliases: conifers
### Keywords: datasets

### ** Examples

# load the tree
data(conifers)

# safe the settings of the plotting device
op <- par()

# set the line width for plotting the branches
par(cex = 0.3)

# plot the phylogenetic tree
plot(conifers)

# restore the settings of the device
par(op)




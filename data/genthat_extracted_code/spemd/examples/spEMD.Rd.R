library(spemd)


### Name: spEMD
### Title: spEMD
### Aliases: spEMD

### ** Examples


# Getting sample data from the gstat package
if (require(gstat)) {
library(sp)

# Example for gridded data
data(ncp.grid, package = 'gstat')
coordinates(ncp.grid) <- ~x+y
gridded(ncp.grid) <- TRUE
res.ncp <- spEMD(ncp.grid, zcol = "depth", thresh.extrema = 0.1, verbose = FALSE)

# Plot results
spplot(res.ncp[, c('imf1', "imf2", "imf3")])
}

#






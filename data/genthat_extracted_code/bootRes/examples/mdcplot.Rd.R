library(bootRes)


### Name: mdcplot
### Title: Plotting Function for Moving Response and Correlation Functions
### Aliases: mdcplot
### Keywords: hplot

### ** Examples

data(muc.clim)
data(muc.spruce)

# calculate and plot bootstrapped correlation function
mdc <- mdcc(muc.spruce, muc.clim, method = "corr")
mdcplot(mdc)




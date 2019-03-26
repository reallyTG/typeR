library(bootRes)


### Name: dcplot
### Title: Plotting Function for Response and Correlation Functions
### Aliases: dcplot
### Keywords: hplot

### ** Examples

## No test: 
data(muc.clim)
data(muc.spruce)

# calculate and plot bootstrapped correlation function
dc <- dcc(muc.spruce, muc.clim, method = "corr")
dcplot(dc)
## End(No test)




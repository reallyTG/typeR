library(automap)


### Name: autofitVariogram
### Title: Automatically fitting a variogram
### Aliases: autofitVariogram

### ** Examples

data(meuse)
coordinates(meuse) =~ x+y
variogram = autofitVariogram(zinc~1,meuse)
plot(variogram)

# Residual variogram
data(meuse)
coordinates(meuse) =~ x+y
variogram = autofitVariogram(zinc ~ soil + ffreq + dist, meuse)
plot(variogram)

# Settings additional fitting options
variogram = autofitVariogram(zinc ~ soil + ffreq + dist, meuse, 
    miscFitOptions = list(merge.small.bins = FALSE))
plot(variogram)

# Settings the minimum number of pairs per bin quite high
# to see the effect of merging bins
variogram = autofitVariogram(zinc ~ soil + ffreq + dist, meuse, 
    miscFitOptions = list(min.np.bin = 500))
plot(variogram)

# ...and disable the merging, note the difference between the two plots
variogram = autofitVariogram(zinc ~ soil + ffreq + dist, meuse, 
    miscFitOptions = list(min.np.bin = 500, merge.small.bins = FALSE))
plot(variogram)

## Not run: 
##D # An example of autofitVariogram with anisotropic sample variogram.
##D # This is not supported, see details section.
##D vm.isotropic = autofitVariogram(log(zinc) ~ dist, meuse)
##D vm.anisotropic = autofitVariogram(log(zinc) ~ dist, meuse, alpha = c(0,45,90,135))
## End(Not run)





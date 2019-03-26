library(comparison)


### Name: two.level.components
### Title: Creates a 'compcovar' object
### Aliases: two.level.components
### Keywords: multivariate

### ** Examples

# load this library
library(comparison)

# load Greg Zadora's glass data
data(glass)

# make it into a data frame
dat <- as.data.frame(glass)

# calculate a compcovar object based upon dat
# using K, Ca and Fe - warning - could take time
# on slower machines
Z <- two.level.components(dat, c(7,8,9), 1)




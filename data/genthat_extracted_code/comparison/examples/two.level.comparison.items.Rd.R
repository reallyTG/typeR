library(comparison)


### Name: two.level.comparison.items
### Title: Creates a 'compitem' object
### Aliases: two.level.comparison.items
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

# calculate a compitem object representing the control item
control <- two.level.comparison.items(dat[37:42,], c(7,8,9))

# calculate a compitem object representing the recovered item
# known to be from the same item (item 4)
recovered.1 <- two.level.comparison.items(dat[43:48,], c(7,8,9))

# calculate a compitem object representing the recovered item
# known to be from a different item (item 6)
recovered.2 <- two.level.comparison.items(dat[67:72,], c(7,8,9))




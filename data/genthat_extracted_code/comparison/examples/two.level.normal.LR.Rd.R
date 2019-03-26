library(comparison)


### Name: two.level.normal.LR
### Title: Likelihood ratio calculation - normal
### Aliases: two.level.normal.LR
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
control <- two.level.comparison.items(dat[1:6,], c(7,8,9))

# calculate a compitem object representing the recovered item
# known to be from the same item (item 1)
recovered.1 <- two.level.comparison.items(dat[7:12,], c(7,8,9))

# calculate a compitem object representing the recovered item
# known to be from a different item (item 2)
recovered.2 <- two.level.comparison.items(dat[19:24,], c(7,8,9))


# calculate the likelihood ratio for a known
# same source comparison - should be 51.16539
lr.1 <- two.level.normal.LR(control, recovered.1, Z)

# calculate the likelihood ratio for a known
# different source comparison - should be 0.02901532
lr.2 <- two.level.normal.LR(control, recovered.2, Z)




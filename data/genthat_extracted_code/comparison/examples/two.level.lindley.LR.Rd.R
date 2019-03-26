library(comparison)


### Name: two.level.lindley.LR
### Title: Likelihood ratio calculation - normal - Lindley's approach
### Aliases: two.level.lindley.LR
### Keywords: univariate

### ** Examples

# load this library
library(comparison)

# load Greg Zadora's glass data
data(glass)

# make it into a data frame
dat <- as.data.frame(glass)

# calculate a compcovar object based upon dat
# using K
Z <- two.level.components(dat, 7, 1)

# calculate a compitem object representing the control item
control <- two.level.comparison.items(dat[1:6,], 7)

# calculate a compitem object representing the recovered item
# known to be from the same item (item 1)
recovered.1 <- two.level.comparison.items(dat[7:12,], 7)

# calculate a compitem object representing the recovered item
# known to be from a different item (item 2)
recovered.2 <- two.level.comparison.items(dat[19:24,], 7)


# calculate the likelihood ratio for a known
# same source comparison - should be 6.323941
lr.1 <- two.level.lindley.LR(control, recovered.1, Z)

# calculate the likelihood ratio for a known
# different source comparison - should be 0.004422907
lr.2 <- two.level.lindley.LR(control, recovered.2, Z)




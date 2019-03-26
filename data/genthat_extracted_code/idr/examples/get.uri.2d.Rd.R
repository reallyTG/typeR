library(idr)


### Name: get.uri.2d
### Title: Compute the correspondence profile (Psi(t, v)) and the
###   derivative of the correspondence profile (Psi'(t, v))
### Aliases: get.uri.2d
### Keywords: internal

### ** Examples


# salmon data from Kallenberg and Ledwina, 1999
data(salmon)

# get.correspondence() needs large ranks have high correlation and
# small ranks have low correlation. In this dataset, small values
# have high correlation and large values have low correlation.
# Ranking negative values makes the data follow the structure required
# by get.correspondence().
# There are 28 observations in this data set.

rank.x <- rank(-salmon$spawners)
rank.y <- rank(-salmon$recruits)
t <- seq(0.01, 0.99, by=1/28)
psi.dpsi <- get.uri.2d(rank.x, rank.y, t, t, spline.df=6.4)




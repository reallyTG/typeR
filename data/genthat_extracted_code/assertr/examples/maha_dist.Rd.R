library(assertr)


### Name: maha_dist
### Title: Computes mahalanobis distance for each row of data frame
### Aliases: maha_dist

### ** Examples


maha_dist(mtcars)

maha_dist(iris, robust=TRUE)


library(magrittr)            # for piping operator
library(dplyr)               # for "everything()" function

# using every column from mtcars, compute mahalanobis distance
# for each observation, and ensure that each distance is within 10
# median absolute deviations from the median
mtcars %>%
  insist_rows(maha_dist, within_n_mads(10), everything())
  ## anything here will run





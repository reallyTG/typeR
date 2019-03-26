library(assertr)


### Name: assertr
### Title: assertr: Assertive programming for R analysis pipeline.
### Aliases: assertr assertr-package

### ** Examples

library(magrittr)     # for the piping operator
library(dplyr)

# this confirms that
#   - that the dataset contains more than 10 observations
#   - that the column for 'miles per gallon' (mpg) is a positive number
#   - that the column for 'miles per gallon' (mpg) does not contain a datum
#     that is outside 4 standard deviations from its mean, and
#   - that the am and vs columns (automatic/manual and v/straight engine,
#     respectively) contain 0s and 1s only
#   - each row contains at most 2 NAs
#   - each row's mahalanobis distance is within 10 median absolute deviations of
#     all the distance (for outlier detection)

mtcars %>%
  verify(nrow(.) > 10) %>%
  verify(mpg > 0) %>%
  insist(within_n_sds(4), mpg) %>%
  assert(in_set(0,1), am, vs) %>%
  assert_rows(num_row_NAs, within_bounds(0,2), everything()) %>%
  insist_rows(maha_dist, within_n_mads(10), everything()) %>%
  group_by(cyl) %>%
  summarise(avg.mpg=mean(mpg))






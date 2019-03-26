library(assertr)


### Name: insist
### Title: Raises error if dynamically created predicate is FALSE in any
###   columns selected
### Aliases: insist insist_

### ** Examples


insist(iris, within_n_sds(3), Sepal.Length)   # returns iris

library(magrittr)

iris %>%
  insist(within_n_sds(4), Sepal.Length:Petal.Width)
  # anything here will run

## Not run: 
##D iris %>%
##D   insist(within_n_sds(3), Sepal.Length:Petal.Width)
##D   # datum at index 16 of 'Sepal.Width' vector is (4.4)
##D   # is outside 3 standard deviations from the mean of Sepal.Width.
##D   # The check fails, raises a fatal error, and the pipeline
##D   # is terminated so nothing after this statement will run
## End(Not run)





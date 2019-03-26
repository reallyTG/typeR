library(Gmisc)


### Name: getPvalWilcox
### Title: P-value extractors for 'getDescriptionStatsBy'
### Aliases: getPvalWilcox getPvalAnova getPvalFisher getPvalChiSq
###   getPvalKruskal

### ** Examples

set.seed(123)
getPvalFisher(sample(letters[1:3], size = 100, replace = TRUE),
              sample(LETTERS[1:3], size = 100, replace = TRUE))
getPvalWilcox(rnorm(100),
              sample(LETTERS[1:2], size = 100, replace = TRUE))




library(sjstats)


### Name: grpmean
### Title: Summary of mean values by group
### Aliases: grpmean

### ** Examples

data(efc)
grpmean(efc, c12hour, e42dep)

data(iris)
grpmean(iris, Sepal.Width, Species)

# also works for grouped data frames
library(dplyr)
efc %>%
  group_by(c172code) %>%
  grpmean(c12hour, e42dep)

# weighting
efc$weight <- abs(rnorm(n = nrow(efc), mean = 1, sd = .5))
grpmean(efc, c12hour, e42dep, weights = weight)





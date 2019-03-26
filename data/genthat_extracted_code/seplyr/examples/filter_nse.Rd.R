library(seplyr)


### Name: filter_nse
### Title: Filter non-standard interface.
### Aliases: filter_nse

### ** Examples


upperBound <- 3.5

datasets::iris %.>%
  filter_nse(., Sepal.Length >= 2 * Sepal.Width,
                  Petal.Length <= upperBound)





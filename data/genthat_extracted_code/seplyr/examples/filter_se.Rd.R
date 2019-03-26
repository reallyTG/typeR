library(seplyr)


### Name: filter_se
### Title: filter standard interface.
### Aliases: filter_se

### ** Examples


upperBound <- 3.5

datasets::iris %.>%
  filter_se(., qe(Sepal.Length >= 2 * Sepal.Width,
                  Petal.Length <= upperBound))






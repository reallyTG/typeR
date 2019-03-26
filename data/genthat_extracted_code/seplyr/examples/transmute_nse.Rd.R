library(seplyr)


### Name: transmute_nse
### Title: transmute non-standard evaluation interface.
### Aliases: transmute_nse

### ** Examples


datasets::iris %.>%
  transmute_nse(., Sepal_Long := Sepal.Length >= 2 * Sepal.Width,
                   Petal_Short := Petal.Length <= 3.5) %.>%
  summary(.)





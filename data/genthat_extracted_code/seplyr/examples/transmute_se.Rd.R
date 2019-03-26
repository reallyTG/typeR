library(seplyr)


### Name: transmute_se
### Title: transmute standard interface.
### Aliases: transmute_se

### ** Examples



datasets::iris %.>%
  transmute_se(., qae(Sepal_Long := Sepal.Length >= 2 * Sepal.Width,
                      Petal_Short := Petal.Length <= 3.5)) %.>%
  summary(.)






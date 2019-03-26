library(seplyr)


### Name: mutate_se
### Title: mutate standard evaluation interface.
### Aliases: mutate_se

### ** Examples



limit <- 3.5

datasets::iris %.>%
  mutate_se(., qae(Sepal_Long = Sepal.Length >= 2 * Sepal.Width,
                   Petal_Short := Petal.Length <= limit)) %.>%
  head(.)






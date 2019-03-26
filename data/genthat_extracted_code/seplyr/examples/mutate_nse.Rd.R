library(seplyr)


### Name: mutate_nse
### Title: mutate non-standard evaluation interface.
### Aliases: mutate_nse

### ** Examples



limit <- 3.5

datasets::iris %.>%
  mutate_nse(., Sepal_Long := Sepal.Length >= 2 * Sepal.Width,
                Petal_Short := Petal.Length <= limit) %.>%
  head(.)

# generates a warning
data.frame(x = 1, y = 2) %.>%
   mutate_nse(., x = y, y = x)





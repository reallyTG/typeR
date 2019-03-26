library(lenses)


### Name: over_with
### Title: Map a function over an in scope lens
### Aliases: over_with

### ** Examples

iris %>% over_with(id_l, ~ Sepal.Length)




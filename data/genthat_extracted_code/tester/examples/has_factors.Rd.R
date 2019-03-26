library(tester)


### Name: has_factors
### Title: Has factors?
### Aliases: has_factors

### ** Examples

has_factors(iris) # TRUE
has_factors(iris[,1:4]) # FALSE
has_factors(list(iris$Species, 1:150)) # TRUE




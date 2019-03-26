library(dplyr)


### Name: n_distinct
### Title: Efficiently count the number of unique values in a set of vector
### Aliases: n_distinct

### ** Examples

x <- sample(1:10, 1e5, rep = TRUE)
length(unique(x))
n_distinct(x)




library(dendextend)


### Name: dist_long
### Title: Turns a dist object to a "long" table
### Aliases: dist_long

### ** Examples

data(iris)
iris[2:6,-5] %>% dist %>% data.matrix
iris[2:6,-5] %>% dist %>% as.vector
iris[2:6,-5] %>% dist %>% dist_long
# This can later be used to making a network plot based on the distances.





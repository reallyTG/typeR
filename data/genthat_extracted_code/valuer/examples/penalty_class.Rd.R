library(valuer)


### Name: penalty_class
### Title: Surrender penalty class
### Aliases: penalty_class
### Keywords: datasets

### ** Examples

#Sets a constant penalty
penalty <- penalty_class$new(type = 1, const = 0.03)
penalty$get()
penalty$set(0.04)
penalty$get()
#Sets a time decreasing penalty of type 2
penalty <- penalty_class$new(type = 2, const = 0.08, T = 10)
penalty$get(time = 0)
penalty$get(time = 2)
penalty$set(0.05)
penalty$get(time = 0)
#Sets a time decreasing penalty of type 3
penalty <- penalty_class$new(type = 3, const = 0.08, T = 10)
penalty$get(time = 0)
penalty$get(time = 2)
penalty$set(0.05)
penalty$get(time = 0)




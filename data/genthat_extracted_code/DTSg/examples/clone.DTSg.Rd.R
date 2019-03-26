library(DTSg)


### Name: clone.DTSg
### Title: Clone Object
### Aliases: clone.DTSg clone

### ** Examples

# new DTSg object
x <- DTSg$new(values = flow)

# make a deep copy
## R6 method
x$clone(deep = TRUE)

## S3 method
clone(x = x, deep = TRUE)





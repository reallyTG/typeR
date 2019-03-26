library(datadr)


### Name: flatten
### Title: "Flatten" a ddf Subset
### Aliases: flatten

### ** Examples

d <- divide(iris, by = "Species")
# the column "Species" is no longer explicitly in the data
d[[1]]$value
# but it is preserved and can be added back in with flatten()
flatten(d[[1]]$value)




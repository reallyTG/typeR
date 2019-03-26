library(photobiologyInOut)


### Name: rspec2mspct
### Title: Convert "pavo::rspec" objects
### Aliases: rspec2mspct rspec2spct

### ** Examples


library(pavo)
data(sicalis)
sicalis.mspct <- rspec2mspct(sicalis)
class(sicalis.mspct)

data(teal)
teal.spct <- rspec2spct(teal)
class(teal.spct)
levels(teal.spct[["spct.idx"]])
angles <- seq(from = 15, to = 75, by = 5) # from teal's documentation
teal.spct[["angle"]] <- angles[as.numeric(teal.spct[["spct.idx"]])]
teal.spct





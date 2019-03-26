library(frite)


### Name: tictocify
### Title: Creates a function that functions identically to the original,
###   but gives execution time
### Aliases: tictocify

### ** Examples


set.seed(1)
stuff <- rnorm(n = 100000)

lapply_new <- tictocify(lapply)
lapply_new(stuff, function(x) x > 0)
is.output.same(lapply_new(stuff, function(x) x > 0), lapply)





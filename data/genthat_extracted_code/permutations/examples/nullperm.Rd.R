library(permutations)


### Name: nullperm
### Title: Null permutations
### Aliases: nullperm nullword nullcycle
### Keywords: datasets

### ** Examples


rperm(10,4)[0]  # null word

as.cycle(1:5)[0]  # null cycle

data(megaminx)
c(NULL,megaminx)      # probably not what the user intended...
c(nullcycle,megaminx) # more useful.
c(id,megaminx)        # also useful.





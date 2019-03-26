library(netdiffuseR)


### Name: diffnet_index
### Title: Indexing diffnet objects (on development)
### Aliases: diffnet_index [[.diffnet [[<-.diffnet [.diffnet [<-.diffnet

### ** Examples


# Creating a random diffusion network ---------------------------------------
set.seed(111)
graph <- rdiffnet(100,5)

# Accessing to a static attribute
graph[["real_threshold"]]

# Accessing to subsets of the adjacency matrix
graph[1,,1:3, drop=TRUE]
graph[,,1:3, drop=TRUE][[1]]

# ... Now, as diffnet objects (the default)
graph[1,,1:3, drop=FALSE]
graph[,,1:3, drop=FALSE]

# Changing values in the adjacency matrix
graph[1, , , drop=TRUE]
graph[1,,] <- -5
graph[1, , , drop=TRUE]

# Adding attributes (dynamic) -----------------------------------------------
# Preparing the data
set.seed(1122)
x <- rdiffnet(30, 5, seed.p.adopt=.15)

# Calculating exposure, and storing it diffe
expoM <- exposure(x)
expoL <- lapply(seq_len(x$meta$nper), function(x) expoM[,x,drop=FALSE])
expoD <- do.call(rbind, expoL)

# Adding data (all these are equivalent)
x[["expoM"]] <- expoM
x[["expoL"]] <- expoL
x[["expoD"]] <- expoD

# Lets compare
identical(x[["expoM"]], x[["expoL"]]) # TRUE
identical(x[["expoM"]], x[["expoD"]]) # TRUE




library(xergm.common)


### Name: adjust
### Title: Adjust the dimensions of a matrix to the dimensions of another
###   matrix
### Aliases: adjust

### ** Examples

# create sociomatrix a with 13 vertices a to m
vertices <- letters[1:13]
a <- matrix(rbinom(length(vertices)^2, 1, 0.1), nrow = length(vertices))
rownames(a) <- colnames(a) <- vertices

# create sociomatrix b with the same vertices except f and k, but additional n
vertices <- c(vertices[-c(6, 11)], "n")
b <- matrix(rbinom(length(vertices)^2, 1, 0.1), nrow = length(vertices))
rownames(b) <- colnames(b) <- vertices

# check dimensions
dim(a)  # 13 x 13
dim(b)  # 12 x 12

# adjust a to b: add n and fill up with NAs; remove f and k
adjust(a, b, add = TRUE, remove = TRUE)

# more complex example with additional attributes stored in the network object; 
# convert a to network objects with additional vertex and network attributes
nw <- network(a)
vertices <- letters[1:13]
nwattrib1 <- matrix(rbinom(length(vertices)^2, 1, 0.1), nrow = length(vertices))
nwattrib2 <- nwattrib1
rownames(nwattrib1) <- colnames(nwattrib1) <- vertices
set.network.attribute(nw, "nwattrib1", nwattrib1)
set.network.attribute(nw, "nwattrib2", nwattrib2)
set.vertex.attribute(nw, "vattrib", 1:length(vertices))

# check presence of the two attributes
list.network.attributes(nw)  # nwattrib1 and nwattrib2 are listed
get.network.attribute(nw, "nwattrib1")  # returns sociomatrix with labels
get.network.attribute(nw, "nwattrib2")  # returns sociomatrix without labels
list.vertex.attributes(nw)  # vattrib is listed
get.vertex.attribute(nw, "vattrib")  # returns numeric vector 1:13

# adjust the network including the two attributes
nw.adjusted <- adjust(nw, b, add = TRUE, remove = TRUE)
as.matrix(nw.adjusted)  # note that the order of nodes may have changed
get.network.attribute(nw.adjusted, "nwattrib1")  # returns adjusted sociomatrix
get.network.attribute(nw.adjusted, "nwattrib2")  # returns adjusted sociomatrix
get.vertex.attribute(nw.adjusted, "vattrib")  # returns adjusted vector




library(rcdd)


### Name: linearity
### Title: Find implicit linearities in H-representation and
###   V-representation of convex polyhedron
### Aliases: linearity
### Keywords: misc

### ** Examples

### calculate affine hull
### determined by given + implied linearity rows
qux <- rbind(c(0, 2, 0, 0, 1),
             c(0, 3, 1, 0, 0),
             c(0, 4, 0, 1, 0),
             c(0, -7, -1, -1, 0))
out <- linearity(qux, representation = "H")
print(out)
qux[out, 1] <- 1
redundant(qux, representation = "H")$output

### calculate minimal nonempty face of polyhedral convex cone
### determined by given + implied linearity rows
qux <- rbind(c(0, 0, 0, 0, 1),
             c(0, 0, 1, 0, 0),
             c(0, 0, 0, 1, 0),
             c(0, 0, -1, -1, 0))
out <- linearity(qux, representation = "V")
print(out)
redundant(qux, representation = "V")$output




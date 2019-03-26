library(clue)


### Name: cl_prototypes
### Title: Partition Prototypes
### Aliases: cl_prototypes
### Keywords: cluster

### ** Examples

## Show how prototypes ("centers") vary across k-means runs on
## bootstrap samples from the Cassini data.
data("Cassini")
nr <- NROW(Cassini$x)
out <- replicate(50,
                 { kmeans(Cassini$x[sample(nr, replace = TRUE), ], 3) },
                 simplify = FALSE)
## Plot the data points in light gray, and the prototypes found.
plot(Cassini$x, col = gray(0.8))
points(do.call("rbind", lapply(out, cl_prototypes)), pch = 19)




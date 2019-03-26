library(scclust)


### Name: scclust
### Title: Constructor for scclust objects
### Aliases: scclust

### ** Examples

# 10 data points in 3 clusters
my_scclust1 <- scclust(c("A", "A", "B", "C", "B",
                         "C", "C", "A", "B", "B"))

# 8 data points in 3 clusters, 2 points unassigned
my_scclust2 <- scclust(c(1, 1, 2, 3, 2,
                         NA, 3, 1, NA, 2))

# Custom labels indicating unassiged points
my_scclust3 <- scclust(c("A", "A", "B", "C", "NONE",
                         "C", "C", "NONE", "B", "B"),
                       unassigned_labels = "NONE")

# Two different labels indicating unassiged points
my_scclust4 <- scclust(c("A", "A", "B", "C", "NONE",
                         "C", "C", "0", "B", "B"),
                       unassigned_labels = c("NONE", "0"))

# Custom data point IDs
my_labels5 <- scclust(c("A", "A", "B", "C", "B",
                        "C", "C", "A", "B", "B"),
                      ids = letters[1:10])





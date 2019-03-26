library(scclust)


### Name: check_clustering
### Title: Check clustering constraints
### Aliases: check_clustering

### ** Examples

# Example scclust clustering
my_scclust <- scclust(c("A", "A", "B", "C", "B",
                        "C", "C", "A", "B", "B"))


# Check so each cluster contains at least two data points
check_clustering(my_scclust, 2)
# > TRUE


# Check so each cluster contains at least four data points
check_clustering(my_scclust, 4)
# > FALSE


# Data point types
my_types <- factor(c("x", "y", "y", "z", "z",
                     "x", "y", "z", "x", "x"))


# Check so each cluster contains at least one point of each type
check_clustering(my_scclust,
                 NULL,
                 my_types,
                 c("x" = 1, "y" = 1, "z" = 1))
# > TRUE


# Check so each cluster contains one data point of both "x" and "z"
# and at least three points in total
check_clustering(my_scclust,
                 3,
                 my_types,
                 c("x" = 1, "z" = 1))
# > TRUE


# Check so each cluster contains five data points of type "y"
check_clustering(my_scclust,
                 NULL,
                 my_types,
                 c("y" = 5))
# > FALSE





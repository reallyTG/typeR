library(distances)


### Name: distances
### Title: Constructor for distance metric objects
### Aliases: distances

### ** Examples

my_data_points <- data.frame(x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                             y = c(10, 9, 8, 7, 6, 6, 7, 8, 9, 10))

# Euclidean distances
my_distances1 <- distances(my_data_points)

# Euclidean distances in only one dimension
my_distances2 <- distances(my_data_points,
                           dist_variables = "x")

# Mahalanobis distances
my_distances3 <- distances(my_data_points,
                           normalize = "mahalanobize")

# Custom normalization matrix
my_norm_mat <- matrix(c(3, 1, 1, 3), nrow = 2)
my_distances4 <- distances(my_data_points,
                           normalize = my_norm_mat)

# Give "x" twice the weight compared to "y"
my_distances5 <- distances(my_data_points,
                           weights = c(2, 1))

# Use normalization and weighting
my_distances6 <- distances(my_data_points,
                           normalize = "mahalanobize",
                           weights = c(2, 1))

# Custom ID labels
my_data_points_withID <- data.frame(my_data_points,
                                    my_ids = letters[1:10])
my_distances7 <- distances(my_data_points_withID,
                           id_variable = "my_ids")



# Compare to standard R functions

all.equal(as.matrix(my_distances1), as.matrix(dist(my_data_points)))
# > TRUE

all.equal(as.matrix(my_distances2), as.matrix(dist(my_data_points[, "x"])))
# > TRUE

tmp_distances <- sqrt(mahalanobis(as.matrix(my_data_points),
                                  unlist(my_data_points[1, ]),
                                  var(my_data_points)))
names(tmp_distances) <- 1:10
all.equal(as.matrix(my_distances3)[1, ], tmp_distances)
# > TRUE

tmp_data_points <- as.matrix(my_data_points)
tmp_data_points[, 1] <- sqrt(2) * tmp_data_points[, 1]
all.equal(as.matrix(my_distances5), as.matrix(dist(tmp_data_points)))
# > TRUE

tmp_data_points <- as.matrix(my_data_points)
tmp_cov_mat <- var(tmp_data_points)
tmp_data_points[, 1] <- sqrt(2) * tmp_data_points[, 1]
tmp_distances <- sqrt(mahalanobis(tmp_data_points,
                                  tmp_data_points[1, ],
                                  tmp_cov_mat))
names(tmp_distances) <- 1:10
all.equal(as.matrix(my_distances6)[1, ], tmp_distances)
# > TRUE

tmp_distances <- as.matrix(dist(my_data_points))
colnames(tmp_distances) <- rownames(tmp_distances) <- letters[1:10]
all.equal(as.matrix(my_distances7), tmp_distances)
# > TRUE





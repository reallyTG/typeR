library(c2c)


### Name: get_conf_mat
### Title: Generate a confusion matrix from two classifications/clustering
###   solutions.
### Aliases: get_conf_mat
### Keywords: confusion matrix

### ** Examples

# meaningless data, but you get the idea

# compare two soft classifications
my_soft_mat1 <- matrix(runif(50,0,1), nrow = 10, ncol = 5)
my_soft_mat2 <- matrix(runif(30,0,1), nrow = 10, ncol = 3)
# make the confusion matrix and calculate stats
conf_mat <- get_conf_mat(my_soft_mat1, my_soft_mat2)
conf_mat; calculate_clustering_metrics(conf_mat)

# compare a soft classification to a vector of hard labels
my_labels <- rep(c("a","b","c"), length.out = 10)
# utilising labels_to_matrix(my_labels)
conf_mat <- get_conf_mat(my_soft_mat1, my_labels)
conf_mat; calculate_clustering_metrics(conf_mat)

# make one of the soft matrices hard
# utilising get_hard(my_soft_mat2)
conf_mat <- get_conf_mat(my_soft_mat1, my_soft_mat2, make.B.hard = TRUE)
conf_mat; calculate_clustering_metrics(conf_mat)

# two classifications with same number of classes, enables percentage agreement
conf_mat <- get_conf_mat(my_soft_mat1, my_soft_mat1)
conf_mat; calculate_clustering_metrics(conf_mat)





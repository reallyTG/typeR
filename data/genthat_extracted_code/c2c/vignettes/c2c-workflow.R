## ------------------------------------------------------------------------
library(c2c)
library(e1071)

## ------------------------------------------------------------------------
data(iris)
iris_dat <- iris[,-5]

## ------------------------------------------------------------------------
fcm3 <- cmeans(x = iris_dat, centers = 3)
fcm3_probs <- fcm3$membership

## ------------------------------------------------------------------------
get_conf_mat(fcm3_probs, iris$Species)

## ------------------------------------------------------------------------
get_conf_mat(fcm3_probs, iris$Species, make.A.hard = TRUE)

## ------------------------------------------------------------------------
fcm6 <- cmeans(x = iris_dat, centers = 10)
fcm6_probs <- fcm6$membership
get_conf_mat(fcm6_probs, iris$Species)
get_conf_mat(fcm6_probs, iris$Species, make.A.hard = TRUE)

## ------------------------------------------------------------------------
head(get_hard(fcm3_probs))
head(labels_to_matrix(iris$Species))

## ------------------------------------------------------------------------
get_conf_mat(fcm3_probs, fcm6_probs)

## ------------------------------------------------------------------------
get_conf_mat(fcm3$cluster, iris$Species)

## ------------------------------------------------------------------------
conf_mat <- get_conf_mat(fcm3_probs, iris$Species)
calculate_clustering_metrics(conf_mat)


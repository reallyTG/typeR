library(neighbr)


### Name: knn
### Title: Classification, regression, and clustering with k nearest
###   neighbors.
### Aliases: knn

### ** Examples

# continuous features with continuous target, categorical target,
# and neighbor ranking

data(iris)

# add an ID column to the data for neighbor ranking
iris$ID <- c(1:150)

# train set contains all predicted variables, features, and ID column
train_set <- iris[1:145,]

# omit predicted variables or ID column from test set
test_set <- iris[146:150,-c(4,5,6)]

fit <- knn(train_set=train_set,test_set=test_set,
           k=5,
           categorical_target="Species",
           continuous_target= "Petal.Width",
           comparison_measure="euclidean",
           return_ranked_neighbors=3,
           id="ID")





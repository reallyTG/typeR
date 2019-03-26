library(FastKNN)


### Name: knn_test_function
### Title: KNN Test The knn_test_function returns the labels for a test set
###   using the k-Nearest Neighbors Clasification method.
### Aliases: knn_test_function

### ** Examples

# Create Data for restaurant reviews
training <- matrix(rexp(600,1), ncol=2)
test  <- matrix(rexp(200,1), ncol=2)
# Label "Good", "Bad", "Average"
labelsExample <- c(rep("Good",100), rep("Bad",100), rep("Average",100))
# Distance Matrix
distanceExample<-Distance_for_KNN_test(test, training)
# KNN
knn_test_function(training, test, distanceExample,labelsExample, k = 3)




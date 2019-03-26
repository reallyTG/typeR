library(klaR)


### Name: predict.NaiveBayes
### Title: Naive Bayes Classifier
### Aliases: predict.NaiveBayes
### Keywords: classif category

### ** Examples


data(iris)
m <- NaiveBayes(Species ~ ., data = iris)
predict(m)




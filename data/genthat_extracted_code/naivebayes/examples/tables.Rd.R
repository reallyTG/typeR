library(naivebayes)


### Name: tables
### Title: Browse Tables of Naive Bayes Classifier
### Aliases: tables

### ** Examples

data(iris)
nb <- naive_bayes(Species ~ ., data = iris)
tables(nb, "Sepal.Length")
tables(nb, 1:2)




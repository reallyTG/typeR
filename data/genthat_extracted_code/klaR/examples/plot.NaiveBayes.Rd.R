library(klaR)


### Name: plot.NaiveBayes
### Title: Naive Bayes Plot
### Aliases: plot.NaiveBayes
### Keywords: classif dplot

### ** Examples

data(iris)
mN <- NaiveBayes(Species ~ ., data = iris)
plot(mN)

mK <- NaiveBayes(Species ~ ., data = iris, usekernel = TRUE)
plot(mK)




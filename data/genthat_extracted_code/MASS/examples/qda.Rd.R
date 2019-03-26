library(MASS)


### Name: qda
### Title: Quadratic Discriminant Analysis
### Aliases: qda qda.data.frame qda.default qda.formula qda.matrix
###   model.frame.qda print.qda
### Keywords: multivariate

### ** Examples

tr <- sample(1:50, 25)
train <- rbind(iris3[tr,,1], iris3[tr,,2], iris3[tr,,3])
test <- rbind(iris3[-tr,,1], iris3[-tr,,2], iris3[-tr,,3])
cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
z <- qda(train, cl)
predict(z,test)$class




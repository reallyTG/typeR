library(MASS)


### Name: predict.qda
### Title: Classify from Quadratic Discriminant Analysis
### Aliases: predict.qda
### Keywords: multivariate

### ** Examples

tr <- sample(1:50, 25)
train <- rbind(iris3[tr,,1], iris3[tr,,2], iris3[tr,,3])
test <- rbind(iris3[-tr,,1], iris3[-tr,,2], iris3[-tr,,3])
cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
zq <- qda(train, cl)
predict(zq, test)$class




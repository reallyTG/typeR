library(ipred)


### Name: slda
### Title: Stabilised Linear Discriminant Analysis
### Aliases: slda slda.default slda.formula slda.factor
### Keywords: multivariate

### ** Examples


library("mlbench")
library("MASS")
learn <- as.data.frame(mlbench.twonorm(100))
test <- as.data.frame(mlbench.twonorm(1000))

mlda <- lda(classes ~ ., data=learn)
mslda <- slda(classes ~ ., data=learn)

print(mean(predict(mlda, newdata=test)$class != test$classes))
print(mean(predict(mslda, newdata=test)$class != test$classes))





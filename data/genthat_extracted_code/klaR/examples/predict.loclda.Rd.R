library(klaR)


### Name: predict.loclda
### Title: Localized Linear Discriminant Analysis (LocLDA)
### Aliases: predict.loclda
### Keywords: multivariate

### ** Examples

data(B3)
x <- loclda(PHASEN ~ ., data = B3, subset = 1:80)
predict(x, B3[-(1:80),])




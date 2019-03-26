library(klaR)


### Name: nm
### Title: Nearest Mean Classification
### Aliases: nm nm.default nm.formula nm.matrix nm.data.frame
### Keywords: classif

### ** Examples

data(B3)
x <- nm(PHASEN ~ ., data = B3)
x$learn
x <- nm(PHASEN ~ ., data = B3, gamma = 0.1)
predict(x)$post




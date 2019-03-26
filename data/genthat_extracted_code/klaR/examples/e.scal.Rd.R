library(klaR)


### Name: e.scal
### Title: Function to calculate e- or softmax scaled membership values
### Aliases: e.scal
### Keywords: classif

### ** Examples

library(MASS)
data(iris)
ldaobj <- lda(Species ~ ., data = iris)
ldapred <- predict(ldaobj)$posterior
e.scal(ldapred)
e.scal(ldapred, tc = iris$Species)




library(sprm)


### Name: sprmda
### Title: Sparse and robust PLS for binary classification
### Aliases: sprmda

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
smod <- sprmda(Species~.,data, a=2, eta=0.7, class="lda")




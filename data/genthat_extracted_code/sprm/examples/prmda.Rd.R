library(sprm)


### Name: prmda
### Title: Robust PLS for binary classification
### Aliases: prmda

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmda(Species~.,data, a=2, class="lda")




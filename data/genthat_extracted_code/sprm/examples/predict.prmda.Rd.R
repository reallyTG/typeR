library(sprm)


### Name: predict.prmda
### Title: Predict method for models of class prmda
### Aliases: predict.prmda

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmda(Species~.,data, a=2, class="lda")
table(data$Species, predict(mod))




library(sprm)


### Name: predict.sprmda
### Title: Predict method for models of class sprmda
### Aliases: predict.sprmda

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
smod <- sprmda(Species~.,data, a=2, eta=0.5, class="lda")
table(data$Species, predict(smod))




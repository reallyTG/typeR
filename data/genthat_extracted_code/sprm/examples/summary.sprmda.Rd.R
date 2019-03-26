library(sprm)


### Name: summary.sprmda
### Title: Summary of a sprmda model
### Aliases: summary.sprmda print.sprmda

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
smod <- sprmda(Species~.,data, a=2, eta=0.7, class="lda")
smod
summary(smod)




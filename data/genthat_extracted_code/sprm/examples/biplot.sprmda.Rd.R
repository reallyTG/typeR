library(sprm)


### Name: biplot.sprmda
### Title: Biplot for sprmda objects of Sparse PRM discriminant analysis
### Aliases: biplot.sprmda
### Keywords: biplot classification

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
smod <- sprmda(Species~.,data, a=2, eta=0.7, class="lda")
biplot(smod)




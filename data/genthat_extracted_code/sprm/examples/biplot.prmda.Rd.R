library(sprm)


### Name: biplot.prmda
### Title: Biplot for prmda objects of PRM discriminant analysis
### Aliases: biplot.prmda
### Keywords: biplot classification

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmda(Species~.,data, a=2, class="lda")
biplot(mod)




library(sprm)


### Name: prmdaCV
### Title: Cross validation method for PRM classification models.
### Aliases: prmdaCV

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmdaCV(Species~.,data, as=1:2, class="lda", numit=10, prec=0.1)
biplot(mod$opt.mod)




library(sprm)


### Name: summary.prmda
### Title: Summary of a prmda model
### Aliases: summary.prmda print.prmda

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmda(Species~.,data, a=2, class="lda")
mod
summary(mod)




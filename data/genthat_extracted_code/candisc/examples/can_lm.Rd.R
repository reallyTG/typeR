library(candisc)


### Name: can_lm
### Title: Transform a Multivariate Linear model mlm to a Canonical
###   Representation
### Aliases: can_lm

### ** Examples

iris.mod <- lm(cbind(Petal.Length, Sepal.Length, Petal.Width, Sepal.Width) ~ Species, data=iris)
iris.can <- can_lm(iris.mod, "Species")
iris.can
Anova(iris.mod)
Anova(iris.can)




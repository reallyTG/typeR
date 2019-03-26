library(FSA)


### Name: Subset
### Title: Subsets/filters a data frame and drops the unused levels.
### Aliases: Subset filterD
### Keywords: misc

### ** Examples

## The problem -- note use of unused level in the final table.
levels(iris$Species)
iris.set1 <- subset(iris,Species=="setosa" | Species=="versicolor")
levels(iris.set1$Species)
xtabs(~Species,data=iris)

## A simpler fix using Subset
iris.set2 <- Subset(iris,Species=="setosa" | Species=="versicolor")
levels(iris.set2$Species)
xtabs(~Species,data=iris.set2)

## A simpler fix using filterD
iris.set3 <- filterD(iris,Species=="setosa" | Species=="versicolor")
levels(iris.set3$Species)
xtabs(~Species,data=iris.set3)





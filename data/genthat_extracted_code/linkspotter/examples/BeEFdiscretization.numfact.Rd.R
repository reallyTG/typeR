library(linkspotter)


### Name: BeEFdiscretization.numfact
### Title: BeEF: Best Equal-Frequency discretization
### Aliases: BeEFdiscretization.numfact

### ** Examples

# calculate a correlation dataframe
data(iris)
discreteSepalLength=BeEFdiscretization.numfact(continuousY=iris$Sepal.Length,factorX=iris$Species)
summary(discreteSepalLength)





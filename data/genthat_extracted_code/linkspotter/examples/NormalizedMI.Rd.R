library(linkspotter)


### Name: NormalizedMI
### Title: Maximal Normalized Mutual Information (MaxNMI) function for 2
###   categorical variables
### Aliases: NormalizedMI

### ** Examples

# calculate a correlation dataframe
data(iris)
discreteSepalLength=BeEFdiscretization.numfact(continuousY=iris$Sepal.Length,factorX=iris$Species)
NormalizedMI(iris$Species,discreteSepalLength)





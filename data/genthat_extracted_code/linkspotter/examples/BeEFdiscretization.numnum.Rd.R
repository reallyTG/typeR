library(linkspotter)


### Name: BeEFdiscretization.numnum
### Title: BeEF: Best Equal-Frequency discretization (for a couple of
###   quantitative variables)
### Aliases: BeEFdiscretization.numnum

### ** Examples

# calculate a correlation dataframe
data(iris)
disc=BeEFdiscretization.numnum(iris$Sepal.Length,iris$Sepal.Width)
summary(disc$x)
summary(disc$y)





library(lava)


### Name: Expand
### Title: Create a Data Frame from All Combinations of Factors
### Aliases: Expand

### ** Examples

dd <- Expand(iris, Sepal.Length=2:8, Species=c("virginica","setosa"))
summary(dd)

T <- with(warpbreaks, table(wool, tension))
Expand(T)




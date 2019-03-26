library(onewaytests)


### Name: gplot
### Title: Box-and-Whisker Plots and Error Bars
### Aliases: gplot
### Keywords: functions

### ** Examples


library(onewaytests)

gplot(Sepal.Length ~ Species, data = iris, type = "boxplot")
gplot(Sepal.Length ~ Species, data = iris, type = "boxplot", violin = FALSE)
gplot(Sepal.Length ~ Species, data = iris, type = "errorbar", option = "se")
gplot(Sepal.Length ~ Species, data = iris, type = "errorbar", option = "sd")





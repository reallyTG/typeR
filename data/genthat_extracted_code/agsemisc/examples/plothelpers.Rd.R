library(agsemisc)


### Name: plothelpers
### Title: Plot helper functions
### Aliases: a.resetplotparams plotfit prepanel.0
### Keywords: dplot color

### ** Examples

data(iris)
a.resetplotparams()
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip,
             prepanel=prepanel.0))
plotfit(lm(Sepal.Length~Sepal.Width, data=iris))




library(questionr)


### Name: clipcopy
### Title: Transform an object into HTML and copy it for export
### Aliases: clipcopy copie copie.default clipcopy.default clipcopy.default
###   copie.proptab clipcopy.proptab copie.proptab
### Keywords: connection

### ** Examples

data(iris)
tab <- table(cut(iris$Sepal.Length,8),cut(iris$Sepal.Width,4))
## Not run: copie(tab)
ptab <- rprop(tab, percent=TRUE)
## Not run: clipcopy(ptab)




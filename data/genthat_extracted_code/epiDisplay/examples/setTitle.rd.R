library(epiDisplay)


### Name: setTitle
### Title: Setting the displayed language of Epicalc graph title
### Aliases: setTitle
### Keywords: database

### ** Examples

.data <- iris
attach(.data)
summ(Sepal.Length, by=Species)
setTitle("English")
dotplot(Sepal.Length, by=Species)
setTitle("Malay")
dotplot(Sepal.Length, by=Species)
setTitle("Spanish")
dotplot(Sepal.Length, by=Species)
detach(.data)
rm(.data)




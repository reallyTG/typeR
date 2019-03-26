library(emil)


### Name: get_response
### Title: Extract the response from a data set
### Aliases: get_response

### ** Examples

identical(iris$Species, get_response(iris, "Species"))
identical(iris$Sepal.Length, get_response(iris, Sepal.Length ~ .))




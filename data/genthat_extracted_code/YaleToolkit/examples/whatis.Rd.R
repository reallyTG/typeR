library(YaleToolkit)


### Name: whatis
### Title: Data frame summary
### Aliases: whatis

### ** Examples

mydf <- data.frame(a=rnorm(100),
                   b=sample(c("Cat", "Dog"), 100, replace=TRUE),
                   c=sample(c("Apple", "Orange", "8"), 100, replace=TRUE),
                   d=sample(c("Blue", "Red"), 100, replace=TRUE))
mydf$d <- as.character(mydf$d)
whatis(mydf)

data(iris)
whatis(iris)




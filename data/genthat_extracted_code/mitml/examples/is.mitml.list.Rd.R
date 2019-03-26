library(mitml)


### Name: is.mitml.list
### Title: Check if an object is of class 'mitml.list'
### Aliases: is.mitml.list

### ** Examples

l <- list(data.frame(x=rnorm(20)))
l <- as.mitml.list(l)
is.mitml.list(l)
# TRUE

l <- as.list(1:10)
is.mitml.list(l)
# FALSE

class(l) <- "mitml.list"
is.mitml.list(l)
# TRUE, with a warning




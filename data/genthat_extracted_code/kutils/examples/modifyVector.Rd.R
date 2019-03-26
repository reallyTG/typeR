library(kutils)


### Name: modifyVector
### Title: Use new information to update a vector. Similar in concept to
###   R's modify list
### Aliases: modifyVector

### ** Examples

x <- c(a = 1, b = 2, c = 3)
y <- c(b = 22)
modifyVector(x, y)
y <- c(c = 7, a = 13, e = 8)
## If augment = TRUE, will add more elements to x
modifyVector(x, y, augment = TRUE)
modifyVector(x, y)
x <- c("a", "b", "c")
y <- c("income", "education", "sei")
## Same as names(x) <- y
modifyVector(x, y)
x <- c("a", "b", "c")
y <- c(a = "happy")
modifyVector(x, y)
y <- c(a = "happy", g = "glum")
## Will give error unless augment = TRUE
modifyVector(x, y, augment = TRUE)




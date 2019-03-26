library(qdapTools)


### Name: text2color
### Title: Map Words to Colors
### Aliases: text2color
### Keywords: color, dictionary lookup, recode,

### ** Examples

x <- structure(list(X1 = structure(c(3L, 1L, 8L, 4L, 7L, 2L, 2L, 2L, 
    4L, 8L, 4L, 3L, 5L, 3L, 1L, 8L, 7L, 2L, 1L, 6L), .Label = c("a", 
    "and", "in", "is", "of", "that", "the", "to"), class = "factor")), 
    .Names = "X1", row.names = c(NA, -20L), class = "data.frame")

#blue was recycled
text2color(x$X1, c("the", "and", "is"), c("red", "green", "blue")) 
text2color(x$X1, c("the", "and", "is"), c("red", "green", "blue", "white"))
x$X2 <- text2color(x$X1, list(c("the", "and", "is"), "that"), 
    c("red", "green", "white"))
x




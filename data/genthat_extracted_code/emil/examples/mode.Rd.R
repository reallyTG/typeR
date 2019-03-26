library(emil)


### Name: mode
### Title: Get the most common value
### Aliases: mode

### ** Examples

mode(mtcars$cyl)
mode(chickwts$feed)
mode(unlist(strsplit("Hello Dolly!", "")))

# Multiple modes
mode(iris$Species)

# Missing values
x <- rep(1:4, 4)
x[2:4] <- NA
mode(x)
mode(x, na.rm=TRUE)

x <- c(rep(1:3, c(4,2,1)), NA)
mode(x, na.rm=FALSE)




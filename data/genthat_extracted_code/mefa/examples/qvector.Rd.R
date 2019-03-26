library(mefa)


### Name: qvector
### Title: Ordinal Transformation of a Vector
### Aliases: qvector
### Keywords: manip

### ** Examples

x <- rnorm(20)
x
y <- qvector(x)
y
rbind(x, y)
plot(x, y, type="h")




library(simecol)


### Name: mixNamedVec
### Title: Mix Two Named Vectors, Resolving Name Conflicts
### Aliases: mixNamedVec
### Keywords: misc

### ** Examples

x <- c(a=1, b=2, c=3)
y <- c(a=1, b=3, d=3)

mixNamedVec(x, y)
mixNamedVec(x, y, resolve.conflicts="x")

mixNamedVec(x, y, resolve.conflicts="x", warn=FALSE)
mixNamedVec(x, y, resolve.conflicts="y", warn=FALSE)

## without names, returns vector named in "resolve conflicts"
x <- as.vector(x)
y <- as.vector(y)
mixNamedVec(x, y)
mixNamedVec(x, y, resolve.conflicts="y")

## names partly
x <- c(4, a=1, b=2, c=3, 4, 9)
y <- c(a=1, 6, b=3, d=3, 8)

mixNamedVec(x, y)
mixNamedVec(x, y, resolve.conflicts="y")




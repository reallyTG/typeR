library(apercu)


### Name: ap
### Title: Apercu of your object
### Aliases: ap

### ** Examples

# Creation of a vector, a matrix, a data frame, a list and 3 arrays of 3, 4
# and 5 dimensions:
v <- c(1:20)
names(v) <- letters[1:20]
m <- matrix(1:100, 10, 10)
dimnames(m) <- list(letters[1:10], letters[1:10])
df <- as.data.frame(m)
li <- lapply(1:10, function(x) {
    u <- matrix((1:100)*x, 10,10)
    dimnames(u) <- list(letters[1:10], letters[1:10])
    return(u)
})
names(li) <- letters[1:10]
a <- array(c(1:1000), c(10,10,10))
dimnames(a) <- list(letters[1:10], letters[1:10], letters[1:10])
a2 <- array(1:10000, c(10,10,10,10))
dimnames(a2) <- list(letters[1:10], letters[1:10], letters[1:10],
    letters[1:10])
a3 <- array(1:100000, c(10,10,10,10,10))
dimnames(a3) <- list(letters[1:10], letters[1:10], letters[1:10],
    letters[1:10], letters[1:10])


# Automatic aperçu of the objects
ap(v)
ap(m)
ap(df)
ap(li)
ap(a)
ap(a2)
ap(a3)

# To print also the dimensions and classes
ap(v, pA = TRUE)
ap(m, pA = TRUE)
ap(df, pA = TRUE)
ap(li, pA = TRUE)
ap(a, pA = TRUE)
ap(a2, pA = TRUE)
ap(a3, pA = TRUE)
# if the size of the object is very small :
sm <- matrix(1:4, 2, 2)
sDf <- as.data.frame(sm)
ap(sm)
ap(sDf)

# Specific aperçu of the objects
ap(v, list(1:2))
ap(m, list(c(1,3), 1:5))
## outputs a vector as only one dimension is given
ap(m, list(c(1,3,1:5)))
## outputs lines 1, 3 and 5, and columns 1 to 10
ap(df, list(c(1,3,5), 1:10))
## the result is different between a list and an array
## as the dimensions of both are not in the same order
ap(li, list(c(1:3,5),c(4,6,9), c(3,6)))
ap(a, list(c(1:3,5),c(4,6,9), c(3,6)))
## outputs the element a[1,3,5]
ap(a, list(1,3,5))
## outputs the element a[c(1,3,5),1,1]
ap(a, list(c(1,3,5)))
ap(a2, list(1:4,3:5,2:8,3:4))
ap(a3, list(1:4,3:5,2:3,3:4,7:10))

# It also works with data frames with a matrix in it:
library(pls)
data("gasoline")
ap(gasoline)
ap(gasoline, list(1:10, list(1:10,1:10)))




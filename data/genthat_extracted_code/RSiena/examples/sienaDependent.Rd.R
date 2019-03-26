library(RSiena)


### Name: sienaDependent
### Title: Function to create a dependent variable for a Siena model
### Aliases: sienaDependent sienaNet
### Keywords: classes

### ** Examples

mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mybeh <- sienaDependent(s50a, type="behavior")
## note that the following example works although the node sets do not yet exist!
mynet3 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)),
       type="bipartite", nodeSet=c("senders", "receivers"))
## sparse matrix input - create some RSiena edgelists first
library(Matrix)
tmps501 <- as(Matrix(s501), "dgTMatrix")
tmps502 <- as(Matrix(s502), "dgTMatrix")
tmps503 <- as(Matrix(s503), "dgTMatrix")
mymat1 <- cbind(tmps501@i + 1, tmps501@j + 1, 1, 1)
mymat2 <- cbind(tmps502@i + 1, tmps502@j + 1, 1, 2)
mymat3 <- cbind(tmps503@i + 1, tmps503@j + 1, 1, 3)
mymat <- rbind(mymat1, mymat2, mymat3)
library(Matrix)
## mymat includes all 3 waves
mymatlist <- by(mymat, mymat[, 4], function(x)
    spMatrix(50, 50, x[, 1], x[, 2], x[, 3]))
mynet4 <- sienaDependent(mymatlist)
## or alternatively
mymat1 <- mymat[mymat[, 4] == 1, ]
mymat2 <- mymat[mymat[, 4] == 2, ]
mymat3 <- mymat[mymat[, 4] == 3, ]
mymat1s <- spMatrix(50, 50, mymat1[, 1], mymat1[, 2], mymat1[, 3])
mymat2s <- spMatrix(50, 50, mymat2[, 1], mymat2[, 2], mymat2[, 3])
mymat3s <- spMatrix(50, 50, mymat3[, 1], mymat3[, 2], mymat3[, 3])
mynet4 <- sienaDependent(list(mymat1s, mymat2s, mymat3s))




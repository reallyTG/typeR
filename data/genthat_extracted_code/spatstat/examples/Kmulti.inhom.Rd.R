library(spatstat)


### Name: Kmulti.inhom
### Title: Inhomogeneous Marked K-Function
### Aliases: Kmulti.inhom
### Keywords: spatial nonparametric

### ** Examples

    # Finnish Pines data: marked by diameter and height
    plot(finpines, which.marks="height")
    II <- (marks(finpines)$height <= 2)
    JJ <- (marks(finpines)$height > 3)
    K <- Kmulti.inhom(finpines, II, JJ)
    plot(K)
    # functions determining subsets
    f1 <- function(X) { marks(X)$height <= 2 }
    f2 <- function(X) { marks(X)$height > 3 }
    K <- Kmulti.inhom(finpines, f1, f2)




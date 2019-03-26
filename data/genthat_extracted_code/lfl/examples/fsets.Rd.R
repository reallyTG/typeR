library(lfl)


### Name: fsets
### Title: A class of a table with several fuzzy sets.
### Aliases: fsets vars specs
### Keywords: models robust

### ** Examples

    # create a matrix of random membership degrees
    m <- matrix(runif(30), ncol=5)
    colnames(m) <- c('a1', 'a2', 'a12', 'b1', 'b2')

    # create vars - first three (a1, a2, a3) and next two (b1, b2)
    # fuzzy sets originate from the same variable
    v <- c('a', 'a', 'a', 'b', 'b')
    names(v) <- colnames(m)

    # create specificity matrix - a1 and a2 are subsets of a12,
    # the rest is incomparable
    s <- matrix(c(0, 0, 1, 0, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0), byrow=TRUE, ncol=5)
    colnames(s) <- colnames(m)
    rownames(s) <- colnames(m)

    # create a valid instance of the fsets class
    o <- fsets(m, v, s)




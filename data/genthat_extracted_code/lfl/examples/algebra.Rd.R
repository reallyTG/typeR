library(lfl)


### Name: algebra
### Title: Algebra for Fuzzy Sets
### Aliases: goedel.tnorm lukas.tnorm goguen.tnorm pgoedel.tnorm
###   plukas.tnorm pgoguen.tnorm goedel.tconorm lukas.tconorm
###   goguen.tconorm pgoedel.tconorm plukas.tconorm pgoguen.tconorm
###   goedel.residuum lukas.residuum goguen.residuum goedel.biresiduum
###   lukas.biresiduum goguen.biresiduum invol.neg strict.neg algebra
###   is.algebra
### Keywords: models robust

### ** Examples

    # direct and parallel version of functions
    goedel.tnorm(c(0.3, 0.2, 0.5), c(0.8, 0.1, 0.5))  # 0.1
    pgoedel.tnorm(c(0.3, 0.2, 0.5), c(0.8, 0.1, 0.5)) # c(0.3, 0.1, 0.5)

    # handling of missing values
    goedel.tnorm(c(0.3, 0, NA), na.rm=TRUE)    # 0
    goedel.tnorm(c(0.3, 0.7, NA), na.rm=TRUE)  # 0.3

    goedel.tnorm(c(0.3, 0, NA), na.rm=FALSE)   # 0
    goedel.tnorm(c(0.3, 0.7, NA), na.rm=FALSE) # NA

    goedel.tconorm(c(0.3, 1, NA), na.rm=TRUE)    # 1
    goedel.tconorm(c(0.3, 0.7, NA), na.rm=TRUE)  # 0.7

    goedel.tconorm(c(0.3, 1, NA), na.rm=FALSE)   # 1
    goedel.tconorm(c(0.3, 0.7, NA), na.rm=FALSE) # NA

    # algebras
    x <- runif(10)
    y <- runif(10)
    a <- algebra('goedel')
    a$n(x)     # negation
    a$t(x, y)  # t-norm
    a$pt(x, y) # parallel t-norm
    a$c(x, y)  # t-conorm
    a$pc(x, y) # parallel t-conorm
    a$r(x, y)  # residuum
    a$b(x, y)  # bi-residuum

    is.algebra(a) # TRUE





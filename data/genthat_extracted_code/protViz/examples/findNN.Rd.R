library(protViz)


### Name: findNN
### Title: find index of nearest neighbor
### Aliases: NN findNN findNN_ lower_bound_

### ** Examples


    (NNidx <- findNN(q <- c(1, 1.0001, 1.24, 1.26), DB <- seq(1, 5 , by = 0.25)))
    (NNidx == c(1, 1, 2, 2))

    DB <- sort(rnorm(100, mean=100, sd = 10))

    # should be 0
    unique(DB[findNN(DB,DB)] - DB)

    q <- rnorm(100, mean=100)

    idx.NN <- findNN(q,DB)
    hist(DB[findNN(q,DB)] - q)

    # definition of findNN holds
    i <- 1:5
    findNN(3.5, i)

    i <- 1:6
    findNN(3.5, i)
    
     # compare ANSI-C binary search with C++ std::lower_bound
    DB <- c(rep(1.0, 3), rep(2.0, 3))
    q <- c(-1, 1.0, 1.01, 1.5, 1.9)
    abs(DB[findNN(q, DB)] - q)
    abs(DB[findNN_(q, DB)] - q)


    DB <- sort(rnorm(100, mean=100, sd=10))
    # should be 0
    unique(DB[findNN_(DB,DB)] - DB)

    q <- rnorm(100, mean=100)

    idx.NN <- findNN_(q, DB)
    hist(DB[findNN_(q, DB)] - q)

    # definition of findNN_ holds
    i <- 1:5
    findNN_(3.5, i)

    i <- 1:6
    findNN_(3.5, i)




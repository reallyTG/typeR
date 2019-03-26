### A collection of helper functions for testing, help create random examples.

rConnectedAdjMatrix <- function(n, p) {
    weights <- runif(n * (n - 1)/2)
    g <- igraph::minimum.spanning.tree(igraph::graph.full(n), weights = weights)
    adjMatrix <- as.matrix(igraph::get.adjacency(g))
    adjMatrix <- (upper.tri(matrix(0, n, n)) & matrix(sample(c(T, F), n^2, replace = T, 
        prob = c(p, 1 - p)), ncol = n)) | adjMatrix
    adjMatrix <- 1 * (adjMatrix | t(adjMatrix))
    return(adjMatrix)
}

rAcyclicDirectedAdjMatrix <- function(n, p) {
    return(1 * (upper.tri(matrix(0, n, n)) & matrix(sample(c(T, F), n^2, replace = T, 
        prob = c(p, 1 - p)), ncol = n)))
}

rDirectedAdjMatrix <- function(n, p) {
    return((1 - diag(n)) * matrix(sample(c(T, F), n^2, replace = T, prob = c(p, 1 - 
        p)), ncol = n))
}

rUndirectedAdjMat <- function(n, p) {
    mat <- matrix(runif(n^2), ncol = n) < p
    mat <- mat * upper.tri(mat)
    return(mat + t(mat))
}

getAdjMat <- function(g) {
    as.matrix(igraph::get.adjacency(g))
}

solvedParentsToIndexMat <- function(solvedParents) {
    nSolved <- sum(sapply(solvedParents, length))
    mat <- matrix(0, ncol = 2, nrow = nSolved)
    k <- 1
    for (i in 1:length(solvedParents)) {
        solved <- solvedParents[[i]]
        if (length(solved) == 0) {
            next
        }
        mat[k:(k + length(solved) - 1), ] <- cbind(solved, rep(i, length(solved)))
        k <- k + length(solved)
    }
    return(mat)
}

randomIdentificationTest <- function(identifier, L, O, solvedParents) {
    n <- nrow(L)
    
    L1 <- L * matrix(runif(n^2, 0.1, 1), n)
    O1 <- (diag(n) + O) * matrix(runif(n^2, 0.1, 1), n)
    O1 <- O1 + t(O1)
    S1 <- t(solve(diag(n) - L1)) %*% O1 %*% solve(diag(n) - L1)
    
    identifiedParams <- identifier(S1)
    toCheck <- solvedParentsToIndexMat(solvedParents)
    expect_true(all(!is.na(identifiedParams$Lambda[toCheck])))
    expect_true(all(abs(identifiedParams$Lambda - L1) < 10^-6, na.rm = T))
    expect_true(all(abs(identifiedParams$Omega - O1) < 10^-6, na.rm = T))
}


### Ensure random.dag.matrix function is available to all tests
random.dag.matrix <- function(pp, nedge){
    ### initialize parameters
    m <- matrix(0, nrow = pp, ncol = pp)
    vals <- rep(0, pp*(pp-1)/2)

    ### randomly sample indices for nonzero coefs
    nonzero_coefs <- sample(seq_along(vals), size = nedge)

    ### given these indices, update the values in m with random values
    ### Note that we are only changing the lower triangular portion
    vals[nonzero_coefs] <- runif(nedge)
    m[lower.tri(m)] <- vals

    ### shuffle the rows and columns
    shuffle <- sample(1:pp)
    m <- m[shuffle, shuffle]

    ### Final output
    m
}

### Generate a random sparse matrix with <= s nonzero elements (returned as a matrix object)
random.sparse <- function(dim, s, diag = TRUE){
    if(length(dim) == 1){
        nrow <- ncol <- dim
    } else if(length(dim) == 2){
        nrow <- dim[1]
        ncol <- dim[2]
    } else{
        stop("dim must have either one or two components!")
    }

    m <- matrix(0, nrow = nrow, ncol = ncol)
    for(i in 1:s){
        m[sample(1:nrow, 1), sample(1:ncol, 1)] <- rnorm(1)
    }

    if(!diag) diag(m) <- rep(0, ncol)

    m
}

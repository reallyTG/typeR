createMatrix <- function(n, p, dimnames) {
    matrix(data = seq_len(n * p), nrow = n, ncol = p, dimnames = dimnames)
}

createLinkedMatrix <- function(n, p, dimnames, class, nNodes) {
    linkedBy <- ifelse(class == "ColumnLinkedMatrix", "columns", "rows")
    linkedMatrix <- LinkedMatrix(nrow = n, ncol = p, nNodes = nNodes, linkedBy = linkedBy, nodeInitializer = "matrixNodeInitializer")
    linkedMatrix[] <- seq_len(n * p)
    dimnames(linkedMatrix) <- dimnames
    return(linkedMatrix)
}

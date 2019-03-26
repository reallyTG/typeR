library("sparsebnUtils") # Expose methods from sparsebnUtils for testing

### Generate data
generate_fixed_data_frame <- function(){
    a0 <- c(0.8723517,  1.2659643,  0.6484813,  1.1892274,  0.4934170, -0.6602971)
    b0 <- c(-0.84539872,  1.29776453,  0.27604776,  0.99424489,  1.19389, -0.03904687)
    c0 <- c(-0.04738671, -0.21364539, -0.45286873, -0.42745932, -0.96944, 0.41352986)
    d0 <- c( 1.0350479, 0.3385954, -0.2297281,  1.2739593,  0.96532, 1.3661716)
    e0 <- c(-0.2284215, -1.6957715, -0.3839743,  1.1515736, -0.27543, 0.6542333)
    data.frame(a0,b0,c0,d0,e0)
}

### Generate empty objects
generate_empty_edgeList <- function(){
    sparsebnUtils::edgeList(list(integer(0)))
}

generate_empty_SparseBlockMatrixR <- function(){
    li <- list(rows = list(integer(0)), vals = list(integer(0)), blocks = list(integer(0)), sigmas = c(0), start = 1)
    SparseBlockMatrixR.list(li)
}

generate_empty_sparsebnFit <- function(){
    li <- list(edges = generate_empty_edgeList(), nodes = "test", lambda = 1, nedge = 0, pp = 1, nn = 10, time = 1)
    sparsebnUtils::sparsebnFit(li)
}

generate_empty_sparsebnPath <- function(){
    sbf <- generate_empty_sparsebnFit()
    sparsebnUtils::sparsebnPath(list(sbf, sbf, sbf, sbf))
}

generate_empty_adjacency_matrix <- function(){
    m <- matrix(0, nrow = 1, ncol = 1)
    m
    # Matrix::Matrix(m)
}

### Generate fixed objects for the following toy DAG
#
# 0 . . . .
# 1 0 . . .
# 0 1 0 . .
# 5 4 0 . .
# 0 3 0 0 .
#
generate_fixed_edgeList <- function(){
    nnode <- 5
    li <- vector("list", length = nnode)
    li[[1]] <- c(2L,4L)
    li[[2]] <- c(3L,4L,5L)
    li[[3]] <- integer(0)
    li[[4]] <- integer(0)
    li[[5]] <- integer(0)
    edgeL <- sparsebnUtils::edgeList(li)

    edgeL
}

generate_fixed_SparseBlockMatrixR <- function(){
    nnode <- 5
    li <- list(rows = vector("list", length = nnode),
               vals = vector("list", length = nnode),
               blocks = vector("list", length = nnode),
               sigmas = numeric(nnode),
               start = 1)

    ### Parents / rows
    li$rows[[1]] <- c(2L,4L)
    li$rows[[2]] <- c(3L,4L,5L)
    li$rows[[3]] <- integer(0)
    li$rows[[4]] <- integer(0)
    li$rows[[5]] <- integer(0)

    ### Values
    li$vals[[1]] <- c(1,5)
    li$vals[[2]] <- c(1,4,3)
    li$vals[[3]] <- integer(0)
    li$vals[[4]] <- integer(0)
    li$vals[[5]] <- integer(0)

    ### Blocks -- LEAVE EMPTY

    ### Sigmas
    li$sigmas <- rep(1,5)

    SparseBlockMatrixR.list(li)
}

generate_fixed_sparsebnFit <- function(){
    # sbm <- generate_fixed_SparseBlockMatrixR()
    edges <- generate_fixed_edgeList()
    sbf <- sparsebnUtils::sparsebnFit(list(edges = edges, nodes = LETTERS[1:num.nodes(edges)], lambda = 1.54, nedge = num.edges(edges), pp = num.nodes(edges), nn = 10, time = 1))

    sbf
}

generate_fixed_sparsebnPath <- function(){
    sbf <- generate_fixed_sparsebnFit()
    sbp <- sparsebnUtils::sparsebnPath(list(sbf, sbf, sbf, sbf))

    sbp
}

generate_fixed_adjacency_matrix <- function(){
    ### CCDr output is unweighted adjacency matrix by default
    m <- rbind(c(0, 0, 0, 0, 0),
               c(1, 0, 0, 0, 0),
               c(0, 1, 0, 0, 0),
               c(1, 1, 0, 0, 0),
               c(0, 1, 0, 0, 0))
    m
    # Matrix::Matrix(m)
}

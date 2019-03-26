context("as.____")

gr <- generate_fixed_graphNEL()
edgeL <- generate_fixed_edgeList()
edgeL0 <- generate_empty_edgeList()
sp <- generate_fixed_sparse()
sp0 <- generate_empty_sparse()
mat <- generate_fixed_matrix()
mat0 <- generate_empty_matrix()
Mat <- generate_fixed_Matrix()
Mat0 <- generate_empty_Matrix()
adjmat <- generate_fixed_adjacency_matrix()
adjmat0 <- generate_empty_adjacency_matrix()
adjMat <- generate_fixed_adjacency_Matrix()
adjMat0 <- generate_empty_adjacency_Matrix()

test_that("Conversion between edgeList <-> sparse works", {
    ### Check null graph
    expect_equivalent(sp0, as.sparse(as.edgeList(sp0)))
    expect_equivalent(edgeL0, as.edgeList(as.sparse(edgeL0)))

    sp$vals <- as.numeric(rep(NA, length(sp$vals))) # vals information will be lost by design so ignore this
    expect_equivalent(sp, as.sparse(as.edgeList(sp)))
    expect_equivalent(edgeL, as.edgeList(as.sparse(edgeL)))
})

test_that("Conversion between edgeList <-> matrix works", {
    ### Check null graph
    expect_equivalent(mat0, as.matrix(as.edgeList(mat0)))
    expect_equivalent(edgeL0, as.edgeList(as.matrix(edgeL0)))

    expect_equivalent(adjmat, as.matrix(as.edgeList(mat))) # output should be adj matrix since weights are lost by design
    expect_equivalent(edgeL, as.edgeList(as.matrix(edgeL)))
})

test_that("Conversion between edgeList <-> graphNEL/igraph/network <-> matrix works", {
    ### Check null graph
    if(requireNamespace("graph", quietly = TRUE)){
        expect_equivalent(edgeL0, as.edgeList(as(mat0, "graphNEL")))
    }

    if(requireNamespace("igraph", quietly = TRUE)){
        expect_equivalent(edgeL0, as.edgeList(igraph::graph.adjacency(mat0, weighted = TRUE)))
    }

    if(requireNamespace("network", quietly = TRUE)){
        expect_equivalent(edgeL0, as.edgeList(network::network(mat0)))
    }
    # MISSING TEST FOR BN

    if(requireNamespace("graph", quietly = TRUE)){
        expect_equivalent(edgeL, as.edgeList(as(mat, "graphNEL")))
    }

    if(requireNamespace("igraph", quietly = TRUE)){
        expect_equivalent(edgeL, as.edgeList(igraph::graph.adjacency(mat, weighted = TRUE)))
    }

    if(requireNamespace("network", quietly = TRUE)){
        expect_equivalent(edgeL, as.edgeList(network::network(mat)))
    }
    # MISSING TEST FOR BN
})

test_that("Conversion between sparse <-> matrix works", {
    ### Check null graph
    expect_equivalent(mat0, as.matrix(as.sparse(mat0)))
    expect_equivalent(sp0, as.sparse(as.matrix(sp0)))

    expect_equivalent(mat, as.matrix(as.sparse(mat))) # output not an adj matrix since sparse preserves weights
    expect_equivalent(sp, as.sparse(as.matrix(sp)))
})

test_that("Conversion between edgeList <-> Matrix works", {
    ### Check null graph
    expect_equivalent(adjMat0, as(as.edgeList(Mat0), "Matrix")) # output should be adj matrix since weights are lost by design
    expect_equivalent(edgeL0, as.edgeList(as(edgeL0, "Matrix")))

    expect_equivalent(adjMat, as(as.edgeList(Mat), "Matrix")) # output should be adj matrix since weights are lost by design
    expect_equivalent(edgeL, as.edgeList(as(edgeL, "Matrix")))
})

test_that("Conversion between sparse <-> Matrix works", {
    ### Check null graph
    expect_equivalent(Mat0, as(as.sparse(mat0), "Matrix")) # output not an adj matrix since sparse preserves weights
    expect_equivalent(sp0, as.sparse(as(sp0, "Matrix")))

    expect_equivalent(Mat, as(as.sparse(mat), "Matrix")) # output not an adj matrix since sparse preserves weights
    expect_equivalent(sp, as.sparse(as(sp, "Matrix")))
})

test_that("Iterative coercing works", {
    ### The tests below fail: In going from edgeList -> sparse, NAs are
    ###  introduced (by design). We could, e.g. output an adjaency matrix
    ###  for sparse -> matrix, but this hides the fact that the weights
    ###  are unknown. For now we leave as-is and expect this test to fail.
    expect_failure(expect_equivalent(sp, as.sparse(as.edgeList(as.matrix(sp)))))
    expect_failure(expect_equivalent(mat, as.matrix(as.sparse(as.edgeList(mat)))))
    expect_failure(expect_equivalent(mat, as.matrix(as.edgeList(as.sparse(mat)))))

    ### edgeList
    expect_equivalent(edgeL, as.edgeList(as.sparse(as.matrix(edgeL))))
    expect_equivalent(edgeL, as.edgeList(as.matrix(as.sparse(edgeL)))) # fixed by 49a80021

    ### sparse
    sp$vals <- as.numeric(rep(1, length(sp$vals))) # weights will be lost by design, and as.matrix will return adjacency matrix
    expect_equivalent(sp, as.sparse(as.matrix(as.edgeList(sp))))
})

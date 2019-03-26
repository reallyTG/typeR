context("edgeList")

test_that("edgeList constructor fails for graphs with no nodes", {
    expect_error(edgeList())
})

test_that("edgeList constructor does NOT fail for empty graphs with >0 nodes", {
    expect_error(edgeList(list(integer(0), integer(0))), NA)
})

test_that("edgeList constructor checks for inconsistent indices", {
    expect_error(edgeList(list(0)))                 # 0 is not a valid index
    expect_error(edgeList(list(1, 1, c(1, 5))))     # 5 > 3 = number of nodes
    expect_error(edgeList(list(1, 1, c(1, -1))))    # -1 is not a valid index
})

test_that("Permuting nodes results in isomorphic output", {
    ### These tests require the igraph pkg
    if(requireNamespace("igraph", quietly = TRUE)){
        ### NOTE: These tests are random, but should return TRUE for any input, so randomization is not an issue
        gr <- random.graph(3,3)
        expect_true(igraph::isomorphic(to_igraph(gr), to_igraph(permute.nodes(gr))))

        gr <- random.graph(10,20)
        expect_true(igraph::isomorphic(to_igraph(gr), to_igraph(permute.nodes(gr))))

        gr <- random.graph(50,200)
        expect_true(igraph::isomorphic(to_igraph(gr), to_igraph(permute.nodes(gr))))
    }
})

test_that("Bugfix: edgeList does not accept NULL or NA values", {
    expect_error(edgeList(list(NULL, NULL)), "Input cannot have any NULL values!")
    expect_error(edgeList(list(1:2, NULL, 2)), "Input cannot have any NULL values!")

    expect_error(edgeList(list(NA, NA)), "Input cannot have missing values!")
    expect_error(edgeList(list(3, NA, 2)), "Input cannot have missing values!")
})

test_that("Bugfix: edgeList accepts combination of integer / numeric values", {
    expect_error(edgeList(list(2, 1L)), NA)  # combo
    expect_error(edgeList(list(2, 1)), NA)   # numeric only
    expect_error(edgeList(list(2L, 1L)), NA) # integer only

    expect_error(edgeList(list(2, 1, integer(0))), NA)   # combo
    expect_error(edgeList(list(2L, 1L, numeric(0))), NA) # combo
})

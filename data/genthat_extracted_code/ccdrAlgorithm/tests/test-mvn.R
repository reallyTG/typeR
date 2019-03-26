context("generate_mvn_data")

el <- generate_fixed_edgeList()
names(el) <- LETTERS[1:num.nodes(el)]
params <- rep(1, num.edges(el) + num.nodes(el))

test_that("Generate MVN data without errors", {
    expect_error(generate_mvn_data(el, params, n = 1, ivn = NULL), NA)
})

test_that("Generate MVN data w/ interventions", {
    nobs <- 10
    ivn <- lapply(1:nobs, function(x) names(el)) # intervene on all nodes
    ivn <- lapply(ivn, function(x) sapply(x, function(x) 1)) # all intervention values = 1
    dat <- generate_mvn_data(el, params, n = nobs, ivn = ivn, ivn.rand = FALSE)
    expect_equal(as.vector(dat), rep(1, nobs*num.nodes(el))) # output is all ones

    nobs <- 10
    nivn <- 3
    ivn <- lapply(1:nobs, function(x) names(el)[1:nivn]) # only intervene on first 3 nodes
    ivn <- lapply(ivn, function(x) sapply(x, function(x) 1)) # all intervention values = 1
    dat <- generate_mvn_data(el, params, n = nobs, ivn = ivn, ivn.rand = FALSE)
    expect_equal(as.vector(dat[, 1:nivn]), rep(1, nobs*nivn)) # first three columns are all ones
})

test_that("ivn.rand = FALSE with invalid input returns an error (fixes issue #4)", {
    nobs <- 10
    nivn <- 3

    ### character / node names input
    ivn <- lapply(1:nobs, function(x) names(el)[1:nivn]) # only intervene on first 3 nodes
    expect_error(generate_mvn_data(el, params, n = nobs, ivn = ivn, ivn.rand = FALSE),
                 "ivn.rand set to FALSE with invalid input")

    ### numeric / index input
    ivn <- lapply(1:nobs, function(x) 1:nivn) # only intervene on first 3 nodes
    expect_error(generate_mvn_data(el, params, n = nobs, ivn = ivn, ivn.rand = FALSE),
                 "ivn.rand set to FALSE with invalid input")
})

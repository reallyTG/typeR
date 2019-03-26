context("graph features")

p <- 20
# generate synthetic graph
G <- huge::huge.generator(p*2, p, "random", verbose=FALSE)$theta


test_that("graph.diss has expected output", {
    Gdiss <- graph.diss(G)
    expect_is(G, "Matrix")
    expect_is(G, "dsCMatrix")
    expect_is(Gdiss, "dgeMatrix")
    expect_equivalent(Matrix::diag(Gdiss), rep(0, p))
})

test_that("natural connectivity has expected output", {
    NCnorm <- natural.connectivity(G, norm=TRUE)
    NC     <- natural.connectivity(G, norm=FALSE)
    expect_lte(NCnorm, 1.0)
    expect_lte(NCnorm, NC)
})

test_that("graphlet corr vec has expected output", {
    gcv.stand <- gcvec(G)
    expect_equal(length(gcv.stand), 55)
    expect_lte(max(gcv.stand), 1)
    expect_gte(min(gcv.stand), -1)

    gcv.nonstand <- gcvec(G, orbind=1:5)
    expect_equal(length(gcv.nonstand), 5*4/2)
    expect_lte(max(gcv.nonstand), 1)
    expect_gte(min(gcv.nonstand), -1)

    expect_error(gcv.one <- gcvec(G, orbind=sample(1:15, 1)), "Only one orbit")
###   expect_equivalent(length(gcv.one), p*(p-1)/2) # deprecated now, this will give an error

    expect_error(gcvec(G, orbind=c(1, 18)), "Only 15 orbits")
})

test_that("estrada class has expected output", {
    ec <- estrada.class(G)
    expect_is(ec, 'numeric')
    expect_equal(length(ec), 1)
    expect_lte(ec, 5)
    expect_gte(ec, 0)
})

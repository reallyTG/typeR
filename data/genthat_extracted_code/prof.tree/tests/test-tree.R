context("Tree structure")

tree <- prof.tree("Rprof.out")

test_that("Input errors", {
    file.create(tmp <- tempfile())
    expect_error(prof.tree(tmp))
    expect_error(prof.tree(""))
    expect_error(prof.tree(tempfile()))
})

test_that("prof.tree class", {
    expect_is(tree, "ProfTree")
    expect_is(tree, "Node")
    expect_is(tree, "R6")
})

test_that("Root has more than 0 children", {
    expect_gt(tree$count, 0)
})

test_that("Root name is calls", {
    expect_equal(tree$name, " *")
})

test_that("Root call environment is null", {
    expect_null(tree$env)
})

test_that("Root realtime more than 0", {
    expect_gt(tree$real, 0)
})

test_that("Root percent time is 1", {
    expect_equal(tree$percent, 1)
})

context("Print tree")

tree <- prof.tree("Rprof.out")

test_that("Print prof.tree returns a data.frame", {
    tree2 <- print(tree)
    expect_is(tree2, "data.frame")
})

test_that("Print contains", {
    expect_output(print(tree), "levelName")
    expect_output(print(tree), "real")
    expect_output(print(tree), "percent")
    expect_output(print(tree), "env")
    expect_output(print(tree), " *")
    expect_output(print(tree), "100.0 %")

})

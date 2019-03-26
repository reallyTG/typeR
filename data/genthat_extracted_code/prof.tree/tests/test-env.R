context("Find a function environment name")

test_that("Get environment name", {
    assign("f", function(x) x, envir = globalenv())
    expect_equal(get_envname("f"), "R_GlobalEnv")
    expect_equal(get_envname("prof.tree"), "prof.tree")
    expect_equal(get_envname("mean"), "base")
    expect_equal(get_envname(".try_quietly"), "tools")
    expect_equal(get_envname("parse_log"), "prof.tree")
})

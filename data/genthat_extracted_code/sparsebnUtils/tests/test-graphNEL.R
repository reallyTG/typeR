context("to_graphNEL")

# gr.empty <- generate_empty_graphNEL() ### MISSING!
gr <- generate_fixed_graphNEL()
edgeL <- generate_fixed_edgeList()

test_that("Bugfix: Conversion from graphNEL to edgeList works when nodes have names", {
    expect_error(to_edgeList(gr), NA)
    expect_equal(to_edgeList(gr), edgeL)
})

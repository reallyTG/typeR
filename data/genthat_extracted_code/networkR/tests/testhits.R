context("hits - Hyperlink-induced topic search")

library(networkR)


from <- c("A", "A", "A", "B", "C")                                                                                                                                                                                           
to <- c("B", "C", "D", "D", "E")                                                                                                                                                                                             
res <- hits(adjacency(from, to))                                                                                                                                                                                                     


## Check output is correct and has not changed
test_that("return a list with three elements (of the right length)", {
    expect_is(res, "list")
    expect_equal(length(res), 3)
    expect_equal(length(res$hubs), length(unique(c(from, to))))
    expect_equal(length(res$authorities), length(unique(c(from, to))))
    expect_equal(length(res$iterations), 1)
})

## Each type should result in a list
test_that("calculations", {
    expect_equal(res$hubs[1], 0.923879529)
    expect_equal(res$authorities[2], 0.5)
})

context("Bidirectional unique works as promissed")

ex <- data.frame(One=c('a', 'c', 'a', 'd', 'd', 'c', 'b'),
                 Two=c('b', 'd', 'b', 'e', 'c', 'd', 'a'), 
                 stringsAsFactors=FALSE)

ex3 <- dplyr::as.tbl(dplyr::bind_cols(ex, data_frame(Three=rep('a', nrow(ex)))))

exMat <- as.matrix(ex)

uniqueBidirection(ex)
uniqueBidirection(ex3)

test_that("Only data.frames can be used", {
    expect_error(uniqueBidirection(exMat))
})

test_that('The correct class is returned', {
    expect_is(uniqueBidirection(ex), 'data.frame')
    expect_is(uniqueBidirection(ex3), 'tbl')
})


test_that('The correct dimension is returned', {
    expect_equal(dim(uniqueBidirection(ex)), c(3, 2))
    expect_equal(dim(uniqueBidirection(ex3)), c(3, 3))
})

test_that('The correct results are returned', {
    expect_equal(uniqueBidirection(ex), 
                 data.frame(One=c('a', 'c', 'd'), Two=c('b', 'd', 'e'), stringsAsFactors=FALSE, row.names=c(1, 2, 4)))
    expect_equal(uniqueBidirection(ex3), 
                 dplyr::data_frame(One=c('a', 'a', 'a'), Two=c('a', 'c', 'd'), Three=c('b', 'd', 'e')))
})

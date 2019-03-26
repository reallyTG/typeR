
context('Test subsetting')

test_that('Subsetting of zoocat object', {
    x <- matrix(1 : 6, nrow = 3)
    colAttr <- data.frame(month = c(2, 3), variable = c('x', 'y'))
    zc <- zoocat(x, order.by = 1991 : 1993, colattr = colAttr)
    expect_is(zc[, 1], 'zoo')
    expect_equal(zc[, 1], zc[,-2])
    expect_identical(index(zc[, 1]), 1991 : 1993)
    expect_identical(is.vector(zc[2, ]), TRUE)
    expect_identical(names(zc[2, ]), c('2_x', '3_y'))
    expect_is(zc[1:2, 1:2], 'zoocat')
    expect_identical(coredata(zc[1:2, 1:2]), 
                     coredata(zc)[1:2, 1:2])
    expect_is(zc[, '2_x'], 'zoo')
    expect_identical(zc[, '2_x'], zc[, 1])
    expect_identical(zc[, '3_y'], zc[, 2])
}
)


test_that("Drop of zoocat object", {
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    expect_true(is.zoo(zc[, 1]))
    expect_true(is.null(dim(zc[, 1])))
    expect_equal(index(zc[, 1]), index(zc))
    expect_true(inherits(zc[, 1, drop = FALSE], 'zoocat'))
    expect_true(is.vector(zc[1, ]))
    expect_true(inherits(zc[1, , drop = FALSE], 'zoocat'))
})

test_that("Test when i and j is negative number", {
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    expect_is(zc[, -2], 'zoocat')
    expect_equal(zc[, -2], zc[, c(1, 3, 4)])
    expect_equal(zc[, 2:3], zc[, -c(1,4)])
})


context('Test coercion between classes')

test_that('as.zoo for zoocat', {
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c('a','a','b','b'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    zo <- as.zoo(zc)
    expect_equal(class(zo), 'zoo')
    expect_equal(colnames(zo), c('2_a', '3_a', '5_b', '6_b'))
    zo <- as.zoo(zc, add.colname = FALSE)
    expect_equal(colnames(zo), NULL)
}
)

test_that('test test unexpected changes of class attribute', {
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c('a','a','b','b'))
    zm <- zoomly(x, order.by = 1991 : 1995, colattr = colAttr)
    index(zm) <- index(zm) + 1
    expect_is(zm, c('zoomly', 'zoocat', 'zooreg', 'zoo'))
})


context('Test cor.zoocat and cor.zoo')

test_that('Test cor.zoo for two vector style zoo objects', {
    x <- zoo(c(1, 3, 2, 4, 5))
    y <- zoo(c(12, 30, 2, 46, 5))
    cc <- cor(x, y)
    expect_is(cc, 'numeric')
    expect_equal(cc, cor(coredata(x), coredata(y)))
})

test_that('Test cor.zoo for two matrix style zoo objects', {
    x <- zoo(matrix(c(1, 3, 2, 4, 5), ncol = 1))
    y <- zoo(matrix(c(12, 30, 2, 46, 5), ncol = 1))
    cc <- cor(x, y)
    expect_is(cc, 'matrix')
    expect_equal(cc, cor(as.matrix(x), as.matrix(y)))
})
    
test_that('Test cor.zoo for one matrix style zoo object', {
    x <- zoo(matrix(c(1, 3, 2, 4, 5, 7), ncol = 2))
    cc <- cor(x)
    expect_is(cc, 'matrix')
    expect_equal(cc, cor(as.matrix(x)))
})

test_that('Test cor.zoo for two matrix style zoo objects', {
    x <- zoo(matrix(c(1, 3, 2, 4, 5), ncol = 1))
    y <- zoo(matrix(c(12, 30, 2, 46, 5), ncol = 1), order.by = 3 : 7)
    expect_error(cor(x, y))
})


test_that('Test cor.zoocat to return a data frame', {
    x <- matrix(rnorm(20), nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    y <- zoo(rnorm(5), order.by = 1991 : 1995)
    df.cor <- cor(zc, y)
    expect_true(all(df.cor$cor.value == cor(as.matrix(zc), as.vector(y))))
})


context('test merge.zoocat:')

test_that('test merge retain index name', {
    x <- matrix(1 : 20, nrow = 5)
    zm <- zoomly(x, order.by = 1991 : 1995,
                 colattr = data.frame(month = c(2, 3, 5, 6)))
    mg <- merge(zm, zm)
    expect_equal(indname(mg), 'year')
})

test_that('test merge with some empty object', {
    x <- matrix(1 : 20, nrow = 5)
    zm <- zoomly(x, order.by = 1991 : 1995,
                 colattr = data.frame(month = c(2, 3, 5, 6)))
    ze <- zoomly()
    mg <- merge(zm, ze)
    attributes(mg)$dimnames <- NULL
    expect_identical(mg, zm)
    
    mg1 <- merge(zm, ze, zm)
    mg2 <- merge(zm, zm)
    attributes(mg1)$dimnames <- NULL
    attributes(mg2)$dimnames <- NULL
    expect_identical(mg1, mg2)
})
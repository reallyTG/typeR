
context('Test Ops')

test_that('Test Ops.zoocat', {
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    zc2 <- zc + 2
    expect_identical(coredata(zc2), coredata(zc) + 2)
    zc3 <- zc + 2 : 5
    expect_identical(coredata(zc3), coredata(zc) + (2 : 5))
    zc4 <- zc * 2 : 5
    expect_identical(coredata(zc4), coredata(zc) * (2 : 5))
    cattr(zc2)[1, 1] <- 5
    expect_error(zc5 <- zc + zc2, info = 'cattr of objects must be identical.')
    zobj <- as.zoo(zc2)
    
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    zc2 <- zc[2 : 3, ]
    s1 <- zc + zc2
    s2 <- zc + zc
    expect_identical(s1, s2[2 : 3, ])
})


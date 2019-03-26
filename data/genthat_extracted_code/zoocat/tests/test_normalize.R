
context('Test normalize')


test_that('test normalize', {
    x <- matrix(1 : 6, nrow = 3)
    colnames(x) <- c('a', 'b')
    rownames(x) <- 1 : 3
    
    expect_equal(normalize(x, method = 'anomaly'), matrix(c(-1,0,1,-1,0,1), nrow = 3), 
                 check.attributes = FALSE)
    expect_equal(normalize(x, method = 'perc'), matrix(c(-50,0,50,-20,0,20), nrow = 3),
                 check.attributes = FALSE)
    expect_equal(normalize(x, method = 'sd1'), matrix(c(-1,0,1,-1,0,1), nrow = 3),
                 check.attributes = FALSE)
    
    expect_identical(colnames(normalize(x, method = 'sd1')), colnames(x))
    expect_identical(rownames(normalize(x, method = 'sd1')), rownames(x))
    expect_true(is.matrix(normalize(x, method = 'sd1')))
    expect_true(is.data.frame(normalize(as.data.frame(x), method = 'sd1')))
    
    x2 <- rbind(c(1000, 1000), x, c(1000, 1000))
    expect_identical(normalize(x2, method = 'anomaly', base.period = c(2, 4))[2:4, ],
                     normalize(x, method = 'anomaly'))
    expect_identical(normalize(x2, method = 'perc', base.period = c(2, 4))[2:4, ],
                     normalize(x, method = 'perc'))
    expect_identical(normalize(x2, method = 'sd1', base.period = c(2, 4))[2:4, ],
                     normalize(x, method = 'sd1'))
    
    
    zobj <- zoo(x2, order.by = 1991 : 1995)
    expect_identical(coredata(normalize(zobj, method = 'anomaly', base.period = 1992 : 1994)), 
                     normalize(x2, method = 'anomaly', base.period = 2 : 4))
    expect_identical(coredata(normalize(zobj, method = 'perc', base.period = 1992 : 1994)), 
                     normalize(x2, method = 'perc', base.period = 2 : 4))
    expect_identical(coredata(normalize(zobj, method = 'sd1', base.period = 1992 : 1994)), 
                     normalize(x2, method = 'sd1', base.period = 2 : 4))
    
    zobj <- zoo(x2, order.by = c(1991, 1993, 1995, 1996, 1997))
    expect_identical(coredata(normalize(zobj, method = 'sd1', base.period = c(1992, 1996))), 
                     normalize(x2, method = 'sd1', base.period = 2 : 4))
    
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    zc.norm <- normalize(zc)
    expect_equal(cattr(zc), cattr(zc.norm))
})
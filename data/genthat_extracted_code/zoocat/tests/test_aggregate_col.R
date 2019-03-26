
context('Test aggregate_col')

test_that('test NA action', {
    zc <- zoocat(x = matrix(c(NA, NA, 1, 2, 1, 2, 1, 2), ncol = 2),
                 colattr = data.frame(a = c(1, 2), b = c(1, 1)))
    zc.aggr <- aggregate_col(zc, by = 'b')
    expect_true(all(is.na(zc.aggr[1 : 2])))
    
})


context('Test filter_col')

test_that('test filter_col_q.zoocat and filter_col.zoocat',  {
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), 
                          site = c('a', 'a', 'b', 'b'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    expect_equal(filter_col_q(zc, quote(month > 2)), zc[, 2 : 4])
    expect_equal(filter_col_q(zc, quote(month > 3)), zc[, 3 : 4])
    expect_equal(filter_col_q(zc, quote(month %in% 3:6 & site == 'b')), zc[, 3:4])
    expect_equal(filter_col_q(zc, quote(site == 'a')), zc[, 1 : 2])
    
    expect_equal(filter_col(zc, month %in% 3:6 & site == 'b'),  zc[, 3 : 4])
    expect_equal(filter_col(zc, site == 'a'), zc[, 1 : 2])
}
)


test_that('test filter_col_q.zoomly and filter_col.zoomly',  {
    x <- matrix(1 : 20, nrow = 5)
    colAttr <- data.frame(month = c(2, 3, 5, 6), 
                          site = c('a', 'a', 'b', 'b'))
    zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
    zm <- as.zoomly(zc)
    
    expect_equal(filter_col_q(zm, quote(month > 2)), zm[, 2 : 4])
    expect_equal(filter_col_q(zm, quote(month > 3)), zm[, 3 : 4])
    expect_equal(filter_col_q(zm, quote(month %in% 3:6 & site == 'b')), zm[, 3:4])
    expect_equal(filter_col_q(zm, quote(site == 'a')), zm[, 1 : 2])
    
    expect_equal(filter_col(zm, month %in% 3:6 & site == 'b'),  zm[, 3 : 4])
    expect_equal(filter_col(zm, site == 'a'), zm[, 1 : 2])
    
    col.f <- filter_col_q(zm, quote(site == 'a'), mon.repro = -10)
    expect_equal(dim(col.f), c(5, 1))
    expect_equal(as.vector(col.f), as.vector(zm[, 1]))
    expect_equal(index(col.f), index(zm) + 1)
    
    col.f <- filter_col_q(zm, quote(site == 'a'), mon.repro = -11 : -10)
    expect_equal(dim(col.f), c(5, 1))
    expect_equal(as.vector(col.f), as.vector(zm[, 1]))
    expect_equal(index(col.f), index(zm) + 1)
    
    col.f <- filter_col_q(zm, mon.repro = -11 : 0)
    expect_is(col.f, 'zoomly')
    expect_equal(as.vector(col.f), as.vector(zm))
    expect_equal(dim(col.f), dim(zm))
    expect_equal(index(col.f), index(zm) + 1)
    expect_equal(cattr(col.f)$month + 12, cattr(zm)$month)
}
)


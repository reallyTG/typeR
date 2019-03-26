library(spduration)
context("Panel data lagging")

test_that("panel_lag returns correct warnings", {

  test.data <- data.frame(x1=c(1,2,3,4,5,6,7,8,9,0), 
                          id1=c(1,1,1,1,1,2,2,2,2,2), 
                          t1=c(1,2,3,4,5,1,2,3,4,5))
  expect_equal(
    panel_lag('x1', 'id1', 't1', lag=1, data=test.data),
    c(NA, 1, 2, 3, 4, NA, 6, 7, 8, 9)
  )
  expect_warning(
    panel_lag('x1', 'id1', 't1', lag=-2, data=test.data),
    regexp="lag is < 0, using [0-9] instead"
  )
  expect_warning(
    panel_lag('x1', 'id1', 't1', lag=6, data=test.data),
    regexp="Lag order was larger than some or all unit series"
  )
})

test_that("panel_lag returns data in original sort", {
  
  test.data <- data.frame(x1=c(1,2,3,4,5,6,7,8,9,0), 
                          id1=c(1,1,1,1,1,2,2,2,2,2), 
                          t1=c(1,2,3,4,5,1,2,3,4,5))
  test.data  <- test.data[sample(1:10), ]
  orig.order <- test.data[, c("id1", "t1")]
  test.data$x1.l1 <- panel_lag('x1', 'id1', 't1', lag=1, data=test.data)
  
  expect_equal(orig.order, test.data[, c("id1", "t1")])
  
  test.data <- test.data[order(test.data$id1, test.data$t1), ]
  
  expect_equal(test.data$x1.l1, c(NA,1,2,3,4,NA,6,7,8,9))
})
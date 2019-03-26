
context("lget.ldat") 

test_that("lget.dat works", {
  
  x_r <- data.frame(x = 1:20, y = letters[1:20])
  x <- as_ldat(x_r)
  
  # Using expect_equivalent othrwise testhtat complains about row.names not
  # matching
  expect_equivalent(as.data.frame(lget(x, index = 1:4)), x_r[1:4, ])
  expect_equivalent(as.data.frame(lget(x, index = c(TRUE, FALSE))), 
    x_r[c(TRUE, FALSE), ])
  expect_equivalent(as.data.frame(lget(x, range=c(3, 6))), 
    x_r[3:6, ])
  expect_equivalent(as.data.frame(lget(x, range=c(3, 3))), 
    x_r[3:3, ])
  expect_equivalent(as.data.frame(lget(x, index = numeric(0))), 
    x_r[numeric(0), ])
  expect_equivalent(as.data.frame(lget(x, index = as.numeric(NA))), 
    x_r[as.numeric(NA), ])
})



context("lset.ldat") 

test_that("lset.dat works", {
  
  x_r <- data.frame(x = 1:20, y = letters[1:20], stringsAsFactors = FALSE)
  x <- as_ldat(x_r)
  
  # Using expect_equivalent othrwise testhtat complains about row.names not
  # matching
  
  lset(x, index = 1:2, data.frame(x = 11:12, y = c("q", "r"), stringsAsFactors = FALSE))
  x_r[1:2, ] <- data.frame(x = 11:12, y = c("q", "r"), stringsAsFactors = FALSE)
  expect_equivalent(as.data.frame(x), x_r)
  
  lset(x, range = 1:2, 
    values = data.frame(x = 11:12, y = c("q", "r"), stringsAsFactors = FALSE))
  x_r[1:2, ] <- data.frame(x = 11:12, y = c("q", "r"), stringsAsFactors = FALSE)
  expect_equivalent(as.data.frame(x), x_r)
  
  
  
  x_r <- data.frame(x = 1:20, y = 1:20, stringsAsFactors = FALSE)
  x <- as_ldat(x_r)

  lset(x, index = 1:2, 11:12)
  x_r[1:2, ] <- 11:12
  expect_equivalent(as.data.frame(x), x_r)
  
  lset(x, range = 1:2,  values = 11:12)
  x_r[1:2, ] <- 11:12
  expect_equivalent(as.data.frame(x), x_r)
  
})


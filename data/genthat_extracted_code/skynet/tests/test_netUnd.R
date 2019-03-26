library(skynet)

context("Create Directed Network")



test_that("make_net_und works", {
  # Run simple net test
  test <- make_net_und(OD_Sample)
  expect_output(str(test), "List of 3")
  expect_output(str(nrow(test$netUnd)), "1531")
})

test_that("make_net_und with disp", {
  # Run simple net test
  test <- make_net_und(OD_Sample, disp = TRUE, alpha = 0.003)
  expect_output(str(nrow(test$netUnd_disp)), "21")
  expect_length(test$gUnd_disp, 10)
  expect_length(test$nodes, 13)
  expect_output(str(class(test$netUnd_disp)), "data.frame")
  expect_output(str(class(test$nodes)), "data.frame")
  expect_output(str(class(test$gUnd_disp)), "igraph")
})

test_that("make_net_und with cap", {
  # Run simple net test
  test <- make_net_und(OD_Sample, cap = TRUE, pct = 10)
  expect_output(str(nrow(test$netUnd_cap)), "126")
  expect_length(test$gUnd_cap, 10)
  expect_length(test$nodes, 13)
  expect_output(str(class(test$netUnd_cap)), "data.frame")
  expect_output(str(class(test$nodes)), "data.frame")
  expect_output(str(class(test$gUnd_cap)), "igraph")
})


test_that("make_net_und with metro", {
  # Run simple net test
  test <- make_net_und(OD_Sample, metro = TRUE)
  expect_output(str(nrow(test$netUnd)), "1211")
  expect_length(test$gUnd, 10)
  expect_length(test$nodes, 8)
  expect_output(str(class(test$netUnd)), "data.frame")
  expect_output(str(class(test$nodes)), "data.frame")
  expect_output(str(class(test$gUnd)), "igraph")
})

test_that("make_net_und with carrier and disp", {
  # Run simple net test
  expect_error(make_net_und(OD_Sample, carrier = TRUE, disp = TRUE))
})


test_that("make_net_und with metro", {
  # Run simple net test
  test <- make_net_und(OD_Sample, carrier = TRUE, merge = FALSE)
  expect_output(str(nrow(test$netUnd)), "1531")
  expect_length(test$gUnd, 10)
})

test_that("make_net_und with metro", {
  # Run simple net test
  test <- make_net_und(OD_Sample, carrier = TRUE, merge = TRUE)
  expect_output(str(nrow(test$netUnd)), "2163")
  expect_length(test$gUnd, 10)
})

test_that("make_net_und with metro", {
  # Run simple net test
  test <- make_net_und(OD_Sample, merge = FALSE)
  expect_output(str(nrow(test$netUnd)), "1531")
  expect_length(test$gUnd, 10)
})

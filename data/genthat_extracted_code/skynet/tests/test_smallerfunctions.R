library(skynet)

context("Test support functions")


test_that("Find Airport", {
  expect_output(print(findAirport("ATL")[2]), "30397")
})

test_that("Find Carrier", {
  expect_output(print(findCarrier("United Air Lines")[1]), "UA")
})

test_that("From To function", {
  test <- make.netDir(OD_Sample)
  expect_output(print(fromto.stat(test$gDir, "JFK", orig = "from")), "78")
})


test_that("boot_network", {
  test <- make.netDir(OD_Sample)
  expect_length(boot_network(test$gDir, n = 10), 4)
  expect_gt(sum(boot_network(test$gDir, n = 10)), 0)
})

test_that("Create Nodes",{
  test <- createNodes(OD_Sample)
  expect_length(test, 6)
  expect_length(test$origin, 251)
})

test_that("Plot Map",{
  test <- net_map(make_net_dir(OD_Sample))
  expect_output(print(class(test)[1]), "gg")
})


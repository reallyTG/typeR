context("utils tests")

test_that("server_address return a string", {

  subdomain <- "main"
  exp_address <- "main.hydroscope.gr"

  expect_equal(server_address(subdomain), exp_address)

})

test_that("server_alive fails", {
  subdomain <- "xxx"
  expect_error(server_alive(subdomain))
})


test_that("degrees are converted to rads",{
degr <- 180
expect_equal(object = deg_to_rads(degr), pi)
})

test_that("computing distance with Haversine Formula", {
  expect_equal(haversine(37.5, 22, 37.5, 23), 88.244145)
})

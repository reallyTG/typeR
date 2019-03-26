library(multicastR)
library(data.table)
context("Invalid vkey")

test_that("vkey is a numeric or character vector", {
#	expect_error(multicast())
#	expect_error(multicast(1606))
#	expect_error(multicast("1606"))
	expect_error(multicast(data.frame("x")))
	expect_error(multicast(TRUE))
})

test_that("vkey has length == 1", {
#	expect_error(multicast())
#	expect_error(1801)
	expect_error(multicast(c(1, 2)))
})

test_that("vkey has valid format", {
#	expect_error(multicast())
#	expect_error(multicast("1606"))
	expect_error(multicast(1))
	expect_error(multicast("1"))
	expect_error(multicast("A"))

	expect_error(multicast(12))
	expect_error(multicast("12"))
	expect_error(multicast("1A"))

	expect_error(multicast(123))
	expect_error(multicast("123"))
	expect_error(multicast("1A2"))

	expect_error(multicast("1A2B"))

	expect_error(multicast(12345))
	expect_error(multicast("12345"))
	expect_error(multicast("1A2B3"))
})

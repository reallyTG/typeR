library(multicastR)
library(data.table)
context("Unlisted vkey")

test_that("vkey is listed in the index", {
#	expect_error(multicast())
#	expect_error(multicast(1801))
	expect_error(multicast(0000))
	expect_error(multicast(-1606))
	expect_error(multicast("0000"))
	expect_error(multicast("-1606"))
})

context("ether functions")

if (requireNamespace("testthat", quietly = TRUE)) {
testthat::test_that("ether types can be converted among them", {
  testthat::expect_equal(ether.toWei(5, "tether"), 5 * 10^30)
  testthat::expect_equal(ether.toKwei(5, "gether"), 5 * 10^24)
  testthat::expect_equal(ether.toMwei(5, "mether"), 5 * 10^18)
  testthat::expect_equal(ether.toGwei(5, "kether"), 5 * 10^12)
  testthat::expect_equal(ether.toSzabo(5, "ether"), 5 * 10^6)
  testthat::expect_equal(ether.toFinney(5, "finney"), 5)
  testthat::expect_equal(ether.toEther(5, "szabo"), 5 / 10^6)
  testthat::expect_equal(ether.toKether(5, "gwei"), 5 / 10^12)
  testthat::expect_equal(ether.toMether(5, "mwei"), 5 / 10^18)
  testthat::expect_equal(ether.toGether(5, "kwei"), 5 / 10^24)
  testthat::expect_equal(ether.toTether(5, "wei"), 5 / 10^30)
})
}

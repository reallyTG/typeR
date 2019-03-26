context("Test of tdcc()")

test_that("Result is correct", {
  # gesichertes Ergebnis aus Iman & Canover (1987):
  temp <- rbind(1:20,
                c(1,3,2,4,16,10,19,12,18,17,
                  20,5,14,7,8,11,6,15,9,13))
  res <- tdcc(temp, pearson = TRUE)["pearson"]
  expect_equal(res, 0.730271, tolerance = 1e-7, check.attributes = FALSE)
})

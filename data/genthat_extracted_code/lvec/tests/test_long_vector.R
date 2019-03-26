context("Long vector support")

test_assignment <- function(a_r, index, values) {
  a <- as_lvec(a_r)
  lset(a, index, values)
  suppressWarnings({ a_r[index] <- values })
  expect_that(as_rvec(a), equals(a_r))
}

test_that("Longvectors are correctly created and can be assigned to", {
  max_max_len <- 1E15
  max_len <- 3E9

  expect_error(a <- lvec(max_max_len+10, type = "integer"))

  #a <- lvec(max_len, type = "integer")
  #expect_that(as_rvec(lget(a, max_len - (0:10))), equals(rep(0, 11)))
  #lset(a, max_len - (0:10), 1:11)
  #expect_that(as_rvec(lget(a, max_len - (0:10))), equals(1:11))

  #a <- lvec(max_len, type = "numeric")
  #expect_that(as_rvec(lget(a, max_len - (0:10))), equals(rep(0.0, 11)))
  #lset(a, max_len - (0:10), 1:11+0.1)
  #expect_that(as_rvec(lget(a, max_len - (0:10))), equals(1:11+0.1))

  #a <- lvec(max_len, type = "logical")
  #expect_that(as_rvec(lget(a, max_len - (0:10))), equals(rep(FALSE, 11)))
  #lset(a, max_len - (0:9), c(TRUE, FALSE))
  #expect_that(as_rvec(lget(a, max_len - (0:9))), 
  #  equals(rep(c(TRUE, FALSE), length.out=10)))

  #a <- lvec(max_len, type = "character", strlen = 3)
  #expect_that(as_rvec(lget(a, max_len - (0:10))), equals(rep("", 11)))
  #lset(a, max_len - (0:9), c("foo", "bar"))
  #expect_that(as_rvec(lget(a, max_len - (0:9))), 
  #  equals(rep(c("foo","bar"), length.out=10)))
})


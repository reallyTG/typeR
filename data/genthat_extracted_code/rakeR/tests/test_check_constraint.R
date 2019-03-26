context("Test check_constraint() function")

test_that("Correct data frame passes", {
  cons <- data.frame(
    "zone"      = letters[1:3],
    "age_0_49"  = c(8L, 2L, 7L),
    "age_gt_50" = c(4L, 8L, 4L),
    "sex_f"     = c(6L, 6L, 8L),
    "sex_m"     = c(6L, 4L, 3L)
  )
  expect_silent(check_constraint(cons, 3))
})

test_that("Character column fail test", {
  cons <- data.frame(
    "zone"      = letters[1:3],
    "age_0_49"  = c(8L, 2L, 7L),
    "age_gt_50" = c(4L, 8L, 4L),
    "sex_f"     = c(6L, 6L, 8L),
    "sex_m"     = c(6L, 4L, 3L)
  )
  cons[, 2] <- as.character(cons[, 2])
  expect_error(check_constraint(cons, 3))
})

test_that("More zones than expected", {
  cons <- data.frame(
    "zone"      = letters[1:4],
    "age_0_49"  = c(8, 2, 7, NA),
    "age_gt_50" = c(4, 8, 4, NA),
    "sex_f"     = c(6, 6, 8, NA),
    "sex_m"     = c(6, 4, 3, NA)
  )
  expect_error(check_constraint(cons, 3))
})

test_that("Zone codes not unique", {
  cons <- data.frame(
    "zone"      = c(letters[1:2], letters[1]),
    "age_0_49"  = c(8, 2, 7),
    "age_gt_50" = c(4, 8, 4),
    "sex_f"     = c(6, 6, 8),
    "sex_m"     = c(6, 4, 3)
  )
  expect_error(check_constraint(cons, 3))
})

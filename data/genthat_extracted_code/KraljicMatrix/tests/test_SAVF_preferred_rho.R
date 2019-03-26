
test_that("SAVF_preferred_rho provides proper messages and warnings", {

  expect_that(
    SAVF_preferred_rho(desired_x = c(3, 4, 5),
                       desired_v = c(.75, .9, 1),
                       x_low = 5,
                       x_high = 1,
                       rho_low = 0,
                       rho_high = 1),
    throws_error()
    )

  expect_that(
    SAVF_preferred_rho(desired_x = c(3, 4, 5),
                       desired_v = c(.75, .9, 1),
                       x_low = 1,
                       x_high = 5,
                       rho_low = 1,
                       rho_high = 0),
    throws_error()
  )

})

test_that("SAVF_preferred_rho has correct dimensions and output type", {

  expect_equal(
    SAVF_preferred_rho(desired_x = c(3, 4, 5),
                       desired_v = c(.75, .9, 1),
                       x_low = 1,
                       x_high = 5,
                       rho_low = 0,
                       rho_high = 1) %>%
      length(), 1)

  expect_true(
    SAVF_preferred_rho(desired_x = c(3, 4, 5),
                       desired_v = c(.75, .9, 1),
                       x_low = 1,
                       x_high = 5,
                       rho_low = 0,
                       rho_high = 1) %>%
      is.numeric()
    )

  expect_true(
    SAVF_preferred_rho(desired_x = c(3, 4, 5),
                       desired_v = c(.75, .9, 1),
                       x_low = 1,
                       x_high = 5,
                       rho_low = 0,
                       rho_high = 1) %>%
      is.atomic()
    )

})

test_that("SAVF_preferred_rho computes correctly", {

  expect_equal(
    SAVF_preferred_rho(desired_x = c(3, 4, 5),
                       desired_v = c(.75, .9, 1),
                       x_low = 1,
                       x_high = 5,
                       rho_low = 0,
                       rho_high = 1) %>%
      round(2),
    0.54
    )

  expect_equal(
    SAVF_preferred_rho(desired_x = c(2, 4, 6),
                       desired_v = c(.5, 1.25, 1.5),
                       x_low = 1,
                       x_high = 6,
                       rho_low = 0,
                       rho_high = 1) %>%
      round(2),
    0.94
  )

})

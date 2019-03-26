context("Nadler Blood Volume")

test_that("blood_vol_Nadler", {
  expect_error(blood_vol_Nadler())
  expect_error(blood_vol_Nadler(height_m = 1))
  expect_error(blood_vol_Nadler(weight_kg = 50))
  expect_error(blood_vol_Nadler(weight_kg = 50, male = TRUE))
  expect_error(blood_vol_Nadler(height_m = 1, weight_kg = 50))

  expect_warning(blood_vol_Nadler(height_m = 0, weight_kg = 50,
                                  male = TRUE, do_warn = TRUE))
  expect_warning(blood_vol_Nadler(height_m = 1, weight_kg = 5000,
                                  male = TRUE, do_warn = TRUE))
  expect_warning(blood_vol_Nadler(height_m = -1, weight_kg = 50,
                                  male = TRUE, do_warn = TRUE))

  expect_warning(blood_vol_Nadler(height_m = 1, weight_kg = -50,
                                  male = TRUE, do_warn = TRUE))
  expect_error(blood_vol_Nadler(height_m = 1, weight_kg = 50, male = ""))
  expect_error(blood_vol_Nadler(height_m = 1, weight_kg = 50, male = "xebec"))
  expect_error(blood_vol_Nadler(height_m = 1, weight_kg = 50,
                                male = list("nonsense", 4)))

  expect_false(blood_vol_Nadler(height_m = 1, weight_kg = 50, male = FALSE) ==
                 blood_vol_Nadler(height_m = 1, weight_kg = 50, male = TRUE)
  )

  h <- c(1, 1.5, 2)
  w <- c(60, 70, 80)
  s <- c(FALSE, FALSE, TRUE)
  r <- blood_vol_Nadler(h, w, s)
  expect_equal(blood_vol_Nadler(h[1], w[1], s[1]), r[1])
  expect_equal(blood_vol_Nadler(h[2], w[2], s[2]), r[2])
  expect_equal(blood_vol_Nadler(h[3], w[3], s[3]), r[3])

})

test_that("Lemmens indexed blood vol", {
  expect_error(blood_vol_Lemmens_indexed())
  expect_error(blood_vol_Lemmens_indexed(2))
  expect_error(blood_vol_Lemmens_indexed(height_m = 2))
  expect_error(blood_vol_Lemmens_indexed(weight_kg = 80))
  expect_error(blood_vol_Lemmens_indexed(bad_input))
  expect_error(blood_vol_Lemmens_indexed(bad_input, bad_input))

  # TODO: expect warnings for crazy height and weight standard across functions

  expect_error(blood_vol_Lemmens_indexed(c(1, 2), 50))
  expect_error(blood_vol_Lemmens_indexed(2, c(50, 80)))

  expect_equal(blood_vol_Lemmens_indexed(2, 100),
               70 / sqrt(100 / (22 * 2 ^ 2)))
})

test_that("Lemmens sedentary blood vol", {
  expect_error(blood_vol_Lemmens_sedentary())
  expect_error(blood_vol_Lemmens_sedentary(2))
  expect_error(blood_vol_Lemmens_sedentary(height_m = 2))
  expect_error(blood_vol_Lemmens_sedentary(weight_kg = 80))
  expect_error(blood_vol_Lemmens_sedentary(bad_input))
  expect_error(blood_vol_Lemmens_sedentary(bad_input, bad_input))

  # TODO: expect warnings for crazy height and weight standard across functions

  expect_error(blood_vol_Lemmens_sedentary(c(1, 2), 50))
  expect_error(blood_vol_Lemmens_sedentary(2, c(50, 80)))

  expect_equal(blood_vol_Lemmens_sedentary(2, 100),
               7000 / sqrt(100 / (22 * 2 ^ 2)))
})

test_that("adj body weight", {
  expect_error(adj_weight_adult())
  expect_error(adj_weight_adult(2))
  expect_error(adj_weight_adult(height_m = 2))
  expect_error(adj_weight_adult(weight_kg = 80))
  expect_error(adj_weight_adult(height_m = 2, weight_kg = 80))
  expect_error(adj_weight_adult(height_m = 2, male = TRUE))
  expect_error(adj_weight_adult(weight_kg = 80, male = TRUE))
  expect_error(adj_weight_adult(bad_input))
  expect_error(adj_weight_adult(bad_input, bad_input))
  expect_error(adj_weight_adult(bad_input, bad_input, bad_input))

  expect_error(adj_weight_adult(c(1, 2), c(40, 80), FALSE))
  expect_error(adj_weight_adult(c(1, 2), 40, c(FALSE, TRUE)))
  expect_error(adj_weight_adult(2, c(40, 80), c(FALSE, TRUE)))

  expect_error(adj_weight_adult(2, 100, "male"))
  expect_error(adj_weight_adult(2, 100, "TRUE"))

  #TODO valid ranges for doing this adjustment, e.g. downwards?
  # the calc depends on what method is used to find ideal body weight:
  expect_equal(adj_weight_adult(2, 100, TRUE),
               0.6 * ideal_weight_adult(2, TRUE) + 40)

})

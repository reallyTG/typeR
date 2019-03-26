context("ideal weight")

#TODO: common tests for all functions with invalid, severely out-of-range inputs

test_that("ideal_weight_adultAdult", {
  inch <- 100 / 2.54
  expect_error(ideal_weight_adult(male = TRUE))
  expect_error(ideal_weight_adult(height_m = 1.7))

  # should warn when height is out of validated range of the formula
  expect_warning(ideal_weight_adult(height_m = 0, male = TRUE, do_warn = TRUE))
  # should warn when height is out of validated range of the formula
  expect_warning(ideal_weight_adult(height_m = -1, male = TRUE, do_warn = TRUE))
  # should warn when height is out of validated range of the formula
  expect_warning(ideal_weight_adult(height_m = 3, male = TRUE, do_warn = TRUE))
  # should warn when height is out of validated range of the formula
  #   expect_warning(ideal_weight_adult(height_m = 59 / inch,
  #                                     male = TRUE,
  #                                     warn = TRUE))
  expect_warning(ideal_weight_adult(height_m = 59 / inch,
                                    male = TRUE,
                                    do_warn = FALSE), NA)

  expect_equal(ideal_weight_adult(60 / inch, male = TRUE), 50)
  expect_equal(ideal_weight_adult(60 / inch, male = F), 45.5)
  expect_equal(ideal_weight_adult(height_m = c(60 / inch, 60 / inch),
                                  male = c(FALSE, TRUE)),
               c(45.5, 50))
  expect_equal(ideal_weight_adult(c(60 / inch, 60 / inch, NA),
                                  male = c(FALSE, TRUE, TRUE)),
               c(45.5, 50, NA))
  expect_equal(ideal_weight_adult(c(60 / inch, 60 / inch, 60 / inch),
                                  male = c(FALSE, NA, TRUE)),
               c(45.5, NA, 50))
  expect_error(ideal_weight_adult(c(60 / inch, 60 / inch, 60 / inch),
                                  male = c(FALSE, TRUE)))
  expect_error(ideal_weight_adult(c(60 / inch, 60 / inch),
                                  male = c(FALSE, TRUE, TRUE)))
  expect_error(ideal_weight_adult(c(), male = c(FALSE, TRUE, TRUE)))
  expect_error(ideal_weight_adult(c(60 / inch, 60 / inch), male = c()))

  expect_warning(
    ideal_weight_adult(12 * 8.5 / inch, male = TRUE, do_warn = TRUE))

})

test_that("Traub", {
  expect_error(ideal_weight_Traub(bad_input))
  expect_error(ideal_weight_Traub(bad_input, bad_input))
  expect_error(ideal_weight_Traub())

  # definitely invalid numbers always warn:
  expect_warning(ideal_weight_Traub(-1, age_y = 10, do_warn = FALSE))
  expect_warning(ideal_weight_Traub(5, age_y = 10, do_warn = FALSE))
  expect_warning(ideal_weight_Traub(1, age_y = -1, do_warn = FALSE))
  expect_warning(ideal_weight_Traub(1, age_y = 200, do_warn = FALSE))

  # optionally warn for unvalidated but possible ages
  expect_warning(ideal_weight_Traub(1, age_y = 0.5, do_warn = TRUE))

  expect_warning(ideal_weight_Traub(1, age_y = 19, do_warn = TRUE))

  expect_warning(ideal_weight_Traub(1, age_y = 0.5, do_warn = FALSE), NA)
  expect_warning(ideal_weight_Traub(1, age_y = 18, do_warn = FALSE), NA)

  # don't need to specify age, because it is not used in calc, just validation
  expect_equal(ideal_weight_Traub(1), 2.396 * exp(1.863))
  expect_equal(ideal_weight_Traub(1, age_y = 3), 2.396 * exp(1.863))
  expect_equal(ideal_weight_Traub(1, age_y = 20 / 12), 2.396 * exp(1.863))
  expect_equal(ideal_weight_Traub(1, age_y = 700 / 365), 2.396 * exp(1.863))
})

test_that("child ideal weight defaults to Traub", {
  expect_equal(ideal_weight_child(1, age_y = 2),
               ideal_weight_Traub(1, age_y = 2))
})

test_that("ideal weight Lemmens", {
  expect_equal(ideal_weight_Lemmens(2), 88)
})

test_that("BMI adult", {
  expect_equal(bmi_adult(2, 100), 25)
})

test_that("BMI adult imperial measure", {
  expect_equal(bmi_adult_ins_lbs(72, 200), 27.124600709)
})

test_that("blood vol Lemmens not obese", {
  expect_error(blood_vol_Lemmens_non_obese())
  expect_error(blood_vol_Lemmens_non_obese(NA))
  expect_error(blood_vol_Lemmens_non_obese(NA, NA))
  expect_error(blood_vol_Lemmens_non_obese(NULL))
  expect_error(blood_vol_Lemmens_non_obese(NULL, NULL))
  expect_error(blood_vol_Lemmens_non_obese(NULL, NULL, NULL))
  expect_error(blood_vol_Lemmens_non_obese(50))
  expect_error(blood_vol_Lemmens_non_obese(weight_kg = 50))
  expect_error(blood_vol_Lemmens_non_obese(age_y = 20))
  expect_error(blood_vol_Lemmens_non_obese(male = TRUE))
  expect_error(blood_vol_Lemmens_non_obese(weight_kg = 50, age_y = 20))
  expect_error(blood_vol_Lemmens_non_obese(age_y = 20, male = FALSE))
  expect_error(blood_vol_Lemmens_non_obese(weight_kg = 50, male = TRUE))
  expect_error(
    blood_vol_Lemmens_non_obese(weight_kg = 50, age_y = 50, male = "M"))
  expect_error(
    blood_vol_Lemmens_non_obese(
      weight_kg = 50, age_y = 50, male = c(TRUE, FALSE)))
  expect_error(
    blood_vol_Lemmens_non_obese(
      weight_kg = 50, age_y = c(50, 60), male = FALSE))
  expect_error(
    blood_vol_Lemmens_non_obese(
      weight_kg = c(50, 75), age_y = 50, male = FALSE))

  expect_equal(blood_vol_Lemmens_non_obese(50, 50, TRUE), 3500)
  expect_equal(blood_vol_Lemmens_non_obese(50, 50, FALSE), 3250)
})

test_that("height, weight funcs invalid input", {
  funs <- c("bsa_adult", "adj_weight", "adj_weight_adult",
            "blood_vol_Lemmens_indexed", "blood_vol_Lemmens_sedentary",
            "blood_vol_Nadler", "bmi_adult", "adj_weight_adult")

  # now give conditions that should be true for all these functions:
  for (f in funs) {
    expect_error(do.call(f), info = f)
    expect_error(do.call(f, bad_input), info = f)
    expect_error(do.call(f, list(height_m = 1.5)), info = f)
    expect_error(do.call(f, list(weight_kg = 40)), info = f)
    expect_error(do.call(f, list(NA_real_)), info = f)
    expect_error(do.call(f, list(NULL)), info = f)
    expect_error(do.call(f, list(NULL, NULL)), info = f)

    #mismatch length
    expect_error(
      do.call(f, list(height_m = c(1.5, 2), weight_kg = 40)), info = f)
    expect_error(
      do.call(f, list(height_m = 2, weight_kg = c(40, 50))), info = f)
    expect_error(
      do.call(f, list(height_m = c(1.5, 2), weight_kg = NULL)), info = f)
    expect_error(
      do.call(f, list(height_m = NULL, weight_kg = c(40, 50))), info = f)
    expect_error(
      do.call(f, list(height_m = c(1.5, NA), weight_kg = 40)), info = f)
    expect_error(
      do.call(f, list(height_m = 2, weight_kg = c(NA, 50))), info = f)
    expect_error(
      do.call(f, list(height_m = NULL, weight_kg = 40)), info = f)
    expect_error(
      do.call(f, list(height_m = 2, weight_kg = NULL)), info = f)

    # stop/warn conditions: we don't know that each specific function doesn't
    # have tighter rules or other arguments required, so we can only look for
    # errors here, if we test all ht/wt functions together.
    expect_error(
      do.call(f,
              list(height_m = -1, weight_kg = 50, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f,
              list(height_m =  0, weight_kg = 50, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f,
              list(height_m = 1.5, weight_kg = -50, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f,
              list(height_m = 1.5, weight_kg =   0, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f,
              list(height_m = 8, weight_kg = 50, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f,
              list(height_m = 1.5, weight_kg = 5000, do.stop = TRUE)), info = f)
  }
})

test_that("height only funcs invalid input", {
  funs <- c("ideal_weight_Lemmens")

  # now give conditions that should be true for all these functions:
  for (f in funs) {
    expect_error(do.call(f), info = f)
    expect_error(do.call(f, bad_input), info = f)
    expect_error(do.call(f, list(NULL)), info = f)
    expect_error(do.call(f, list(NULL, NULL)), info = f)

    # stop/warn conditions: we don't know that each specific function doesn't
    # have tighter rules or other arguments required, so we can only look for
    # errors here, if we test all ht/wt functions together.
    expect_error(do.call(f, list(height_m = -1, do.stop = TRUE)), info = f)
    expect_error(do.call(f, list(height_m =  0, do.stop = TRUE)), info = f)
    expect_error(do.call(f, list(height_m = 8, do.stop = TRUE)), info = f)
  }
})

test_that("height, gender funcs invalid input", {
  funs <- c("ideal_weight_adult", "ideal_weight_Broca",
            "ideal_weight_Devine", "ideal_weight_Miller",
            "ideal_weight_Robinson"
  )

  # now give conditions that should be true for all these functions:
  for (f in funs) {
    expect_error(do.call(f), info = f)
    expect_error(do.call(f, bad_input), info = f)
    expect_error(do.call(f, list(height_m = 1.5)), info = f)
    expect_error(do.call(f, list(male = T)), info = f)
    expect_error(do.call(f, list(NA_real_)), info = f)
    expect_error(do.call(f, list(NULL)), info = f)
    expect_error(do.call(f, list(NULL, NULL)), info = f)

    #mismatch length
    expect_error(do.call(f, list(height_m = c(1.5, 2), male = T)), info = f)
    expect_error(do.call(f, list(height_m = 2, male = c(T, F))), info = f)
    expect_error(do.call(f, list(height_m = c(1.5, 2), male = NULL)), info = f)
    expect_error(do.call(f, list(height_m = NULL, male = c(T, F))), info = f)
    expect_error(do.call(f, list(height_m = c(1.5, NA), male = T)), info = f)
    expect_error(do.call(f, list(height_m = 2, male = c(NA, T))), info = f)
    expect_error(do.call(f, list(height_m = NULL, male = F)), info = f)
    expect_error(do.call(f, list(height_m = 2, male = NULL)), info = f)

    # stop/warn conditions: we don't know that each specific function doesn't
    # have tighter rules or other arguments required, so we can only look for
    # errors here, if we test all ht/wt functions together.
    expect_error(
      do.call(f, list(height_m = -1, male = T, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f, list(height_m =  0, male = T, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f, list(height_m = 1.5, male = "m", do.stop = TRUE)), info = f)
    expect_error(
      do.call(f, list(height_m = 1.5, male = 2L, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f, list(height_m = 1.5, male = -1, do.stop = TRUE)), info = f)
    expect_error(
      do.call(f, list(height_m = 8, male = T, do.stop = TRUE)), info = f)
  }
})

test_that("ideal weight determine by age", {
  expect_identical(
    ideal_weight(1.8, male = TRUE),
    ideal_weight_adult(1.8, male = TRUE))
  expect_identical(
    ideal_weight(1.8, male = TRUE),
    ideal_weight_adult(1.8, male = TRUE))
  expect_identical(
    ideal_weight(1.8, male = TRUE, age_y = 99),
    ideal_weight_adult(1.8, male = TRUE))
  expect_identical(
    ideal_weight(1, male = FALSE, age_y = age_m_to_y(23)),
    ideal_weight_child(1, age_y = age_m_to_y(23)))
})

test_that("invalid data with stop option", {
  expect_error(
    ideal_weight(-1, male = FALSE, age_y = age_m_to_y(23), do_stop = TRUE)
  )
})

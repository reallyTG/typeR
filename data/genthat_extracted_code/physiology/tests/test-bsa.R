context("BSA")

test_that("body surface area, deprecated", {
  expect_identical(
    bsa_adult(height_m = c(NA, 2), weight_kg = c(70, 72)),
    bsa_mosteller(height_m = c(NA, 2), weight_kg = c(70, 72))
  )
})

test_that("body surface area, dubois", {
  expect_equal(
    bsa_dubois_dubois(height_m = 1.5, weight_kg = 100),
    0.007184 * 100^0.425 * 150^0.725
  )
})

test_that("body surface area, haycock", {
  expect_equal(
    bsa_haycock(height_m = 1.5, weight_kg = 100),
    0.024265 * 100^0.5378 * 150^0.3964
  )
})

test_that("body surface area, haycock", {
  expect_equal(
    bsa_gehan_george(height_m = 1.5, weight_kg = 100),
    0.0235 * 100^0.51456 * 150^0.42246
  )
})

test_that("body surface area, boyd", {
  expect_equal(
    bsa_boyd(height_m = 1.5, weight_kg = 100),
    0.0333 * 100 ^ (0.6157 - 0.0188 * log10(100)) * (1.5 * 100) ^ 0.3
  )
})

test_that("body surface area, fujimoto", {
  expect_equal(
    bsa_fujimoto(height_m = 1.5, weight_kg = 100),
    0.008883 * 100^0.444 * 150^0.663
  )
})

test_that("body surface area, takahira", {
  expect_equal(
    bsa_takahira(height_m = 1.5, weight_kg = 100),
    0.007241 * 100^0.425 * 150^0.725
  )
})

test_that("body surface area, shuter", {
  expect_equal(
    bsa_shuter_aslani(height_m = 1.5, weight_kg = 100),
    0.00949 * 100^0.441 * 150^0.655
  )
})

test_that("body surface area, schlich", {
  expect_equal(
    bsa_schlich(height_m = 1.5, weight_kg = 100, male = FALSE),
    0.000975482 * 100^0.46 * 150^1.08
  )
  expect_equal(
    bsa_schlich(height_m = 1.5, weight_kg = 100, male = TRUE),
    0.000579479 * 100^0.38 * 150^1.24
  )
})

test_that("body surface area test interface fuzzing", {
  bsa_functions <-
    setdiff(
      grep(pattern = "^bsa", getNamespaceExports("physiology"), value = TRUE),
      c("bsa_simple", "bsa_adult")
    )
  good_args <-
    list(
      height_m = 1,
      weight_kg = 100,
      male = FALSE
    )
  good_vector_args <-
    list(
      height_m = c(1, 1.1),
      weight_kg = c(100, 101),
      male = c(FALSE, TRUE)
    )
  bad_args <-
    list(
      height_m =
        list(
          "A",
          factor("A")
        ),
      weight_kg =
        list(
          "A",
          factor("A")
        ),
      male =
        list(
          1, 0,
          "A",
          factor("A")
        )
    )
  for (current_fun in bsa_functions) {
    current_good_args <- good_args
    current_bad_args <- bad_args
    current_vector_args <- good_vector_args
    if (!("male" %in% names(formals(current_fun)))) {
      current_good_args$male <- NULL
      current_bad_args$male <- NULL
      current_vector_args$male <- NULL
    } else {
      # confirm that male and female give different results
      tmp_args_male <- current_good_args
      tmp_args_female <- current_good_args
      tmp_args_male$male <- TRUE
      tmp_args_female$male <- FALSE
      expect_false(
        do.call(current_fun, tmp_args_male) ==
          do.call(current_fun, tmp_args_female)
      )
    }
    expect_is(do.call(current_fun, current_good_args), "numeric")
    expect_is(do.call(current_fun, current_vector_args), "numeric")
    for (nm in names(current_good_args)) {
      # Drop one argument, that should cause an error
      tmp_args <- current_good_args[setdiff(names(current_good_args), nm)]
      expect_error(do.call(current_fun, tmp_args),
                   regexp = "is missing"
      )
    }
    for (nm in names(current_bad_args)) {
      for (idx in seq_along(current_bad_args[[nm]])) {
        tmp_args <- current_good_args
        tmp_args[[nm]] <- current_bad_args[[nm]][[idx]]
        expect_error(do.call(current_fun, tmp_args))
      }
    }
  }
})

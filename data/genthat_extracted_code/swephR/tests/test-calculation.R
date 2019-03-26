context("Calculation of planets and stars")

test_that("non-existent planet produces error (ET)", {
  result <- swe_calc(1234.567, -2,4)
  expect_true(is.list(result))
  expect_equal(result$return, -1)
  expect_equal(result$serr, "illegal planet number -2.")
  swe_close()
})

test_that("Sun near present day with SEFLG_MOSEPH (ET)", {
    result <- swe_calc(2458346.82639, 0, 4)
    expect_true(is.list(result))
    expect_equal(result$return, 4)
    expect_equal(result$serr, "")
    expect_equal(result$xx, c(143.411541546115, 0.000153328074557681, 1.01265945421508, 0, 0, 0))
    swe_close()
})

test_that("Sun near present day with SEFLG_SWIEPH (ET)", {
    skip_if_not_installed("swephRdata")
    result <- swe_calc(2458346.82639, 0, 2)
    expect_true(is.list(result))
    expect_equal(result$return, 2)
    expect_equal(result$serr, "")
    expect_equal(result$xx, c(143.411548004662, 0.000154522097263712, 1.01265952395477, 0, 0, 0))
    swe_close()
})

test_that("Moon near present day with SEFLG_MOSEPH (ET)", {
  result <- swe_calc(2458346.82639, 1, 4)
  expect_true(is.list(result))
  expect_equal(result$return, 4)
  expect_equal(result$serr, "")
  expect_equal(result$xx, c(209.393205609575, 5.23865656062778, 0.00254763959909033, 0, 0, 0))
  swe_close()
})

test_that("Moon near present day with SEFLG_MOSEPH (UT)", {
  result <- swe_calc_ut(2458346.82639, 1, 4)
  expect_true(is.list(result))
  expect_equal(result$return, 4)
  expect_equal(result$serr, "")
  expect_equal(result$xx, c(2.09403930530591e+02, 5.23876557411171e+00, 2.54767266268742e-03, 0, 0, 0))
  swe_close()
})

test_that("Moon near present day with SEFLG_SWIEPH (ET)", {
    skip_if_not_installed("swephRdata")
    result <- swe_calc(2458346.82639, 1, 2)
    expect_true(is.list(result))
    expect_equal(result$return, 2)
    expect_equal(result$serr, "")
    expect_equal(result$xx, c(209.393307909087, 5.23884819964366, 0.00254765467381015, 0, 0, 0), tolerance = .00001)
    swe_close()
})

test_that("Sun and Moon near present day with SEFLG_MOSEPH (ET)", {
    result <- swe_calc(2458346.82639, c(0, 1), 4)
    expect_true(is.list(result))
    expect_equal(result$return, c(4, 4))
    expect_equal(result$serr, c("", ""))
    expect_equal(result$xx, matrix(c(143.411541546115, 0.000153328074557681, 1.01265945421508, 0, 0, 0,
                                     209.393205609575, 5.23865656062778, 0.00254763959909033, 0, 0, 0),
                                   nrow = 2, byrow = TRUE))
    swe_close()
})

test_that("Mercury near present day with SEFLG_MOSEPH (ET)", {
    result <- swe_calc(2458346.82639, 2, 4)
    expect_true(is.list(result))
    expect_equal(result$return, 4)
    expect_equal(result$serr, "")
    expect_equal(result$xx, c(132.01192327168, -3.48121475787494, 0.67906546508584, 0, 0, 0))
    swe_close()
})

test_that("Mercury near present day with SEFLG_SWIEPH (ET)", {
    skip_if_not_installed("swephRdata")
    result <- swe_calc(2458346.82639, 2, 2)
    expect_true(is.list(result))
    expect_equal(result$return, 2)
    expect_equal(result$serr, "")
    expect_equal(result$xx, c(132.011933922771, -3.48121306761461, 0.679065645713915, 0, 0, 0))
    swe_close()
})

test_that("Existing star position (ET)", {
  swe_set_topo(0,50,10)
  result <- swe_fixstar2("sirius",1234567,34820)
  expect_true(is.list(result))
  expect_equal(result$return, 34820)
  expect_equal(result$star, "Sirius,alCMa")
  expect_equal(result$xx, c(64.6573398258270  , -17.8051962679158 , 551818.7534446509089, 0,0,0),tolerance = .00001)
  swe_close()
})

test_that("Existing star position (UT)", {
  swe_set_topo(0,50,10)
  result <- swe_fixstar2_ut("sirius",1234567,34820)
  expect_true(is.list(result))
  expect_equal(result$return, 34820)
  expect_equal(result$star, "Sirius,alCMa")
  expect_equal(result$xx, c(64.6572872143770,    -17.8051778192498, 551818.7549828081392, 0,0,0),tolerance = .00001)
  swe_close()
})


test_that("Two existing stars positions (ET)", {
  swe_set_topo(0,50,10)
  result <- swe_fixstar2(c("sirius", "aldebaran"), 1234567, 34820)
  expect_true(is.list(result))
  expect_equal(result$return, c(34820, 34820))
  expect_equal(result$star, c("Sirius,alCMa", "Aldebaran,alTau"))
  expect_equal(result$xx, matrix(c(6.465315e+01, -1.780315e+01, 5.518192e+05, -3.482530e-04, 1.170200e-05, -3.109594e-03,
                                   2.385093e+01, 4.006615e+00, 4.138739e+06, 0.000000e+00, 0.000000e+00, 0.000000e+00),
                                nrow = 2, byrow = TRUE), tolerance = .00001)
  swe_close()
})


test_that("Existing star magnitude", {
  result <- swe_fixstar2_mag("sirius")
  expect_true(is.list(result))
  expect_equal(result$return, 0)
  expect_equal(result$star, "Sirius,alCMa")
  expect_equal(result$mag, -1.46)
  swe_close()
})

test_that("Two existing star magnitudes", {
  result <- swe_fixstar2_mag(c("sirius", "aldebaran"))
  expect_true(is.list(result))
  expect_equal(result$return, c(0, 0))
  expect_equal(result$star, c("Sirius,alCMa", "Aldebaran,alTau"))
  expect_equal(result$mag, c(-1.46, 0.86))
  swe_close()
})

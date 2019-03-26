context("Consistency (PPP)")

none.na = function(...) {
  lst = list(...)
  f = function(x, y) x & ! is.na(y)
  purrr::reduce(lst, f, .init = TRUE)
}

test_that("F = product P * g * e * f", {
  regions <- kaya_region_list()
  for (r in regions) {
    kd <- get_kaya_data(r, gdp="PPP", quiet = TRUE) %>%
      dplyr::filter(none.na(F, P, g, e, f))
    if (nrow(kd) > 0) {
      expect_equal(kd$F, kd$P * kd$g * kd$e * kd$f, tolerance = 1E-6,
                   label = "F", expected.label = "Pgef")
    }
  }
})

test_that("G = product P * g", {
  regions <- kaya_region_list()
  for (r in regions) {
    kd <- get_kaya_data(r, gdp="PPP", quiet = TRUE) %>%
      dplyr::filter(none.na(G, P, g))
    if (nrow(kd) > 0) {
      expect_equal(kd$G, kd$P * kd$g, tolerance = 1E-6,
                   label = "G", expected.label = "Pg")
    }
  }
})


test_that("E = product G * e", {
  regions <- kaya_region_list()
  for (r in regions) {
    kd <- get_kaya_data(r, gdp="PPP", quiet = TRUE) %>%
      dplyr::filter(none.na(E, G, e))
    if (nrow(kd) > 0) {
      expect_equal(kd$E, kd$G * kd$e, tolerance = 1E-6,
                   label = "E", expected.label = "Ge")
    }
  }
})

test_that("ef = product e * f", {
  regions <- kaya_region_list()
  for (r in regions) {
    kd <- get_kaya_data(r, gdp="PPP", quiet = TRUE) %>%
      dplyr::filter(none.na(ef, e, f))
    if (nrow(kd) > 0) {
      expect_equal(kd$ef, kd$e * kd$f, tolerance = 1E-6,
                   label = "ef", expected.label = "e * f")
    }
  }
})

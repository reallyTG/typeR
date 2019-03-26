context("Fuel mix consistency")

none.na = function(...) {
  lst = list(...)
  f = function(x, y) x & ! is.na(y)
  purrr::reduce(lst, f, .init = TRUE)
}

test_that("Fuel mix adds up", {
  regions <- kaya_region_list()
  for (r in regions) {
    fm <- get_fuel_mix(r, quiet = TRUE)
    if (nrow(fm) > 0) {
      y <- fm$year[1]
      fm <- fm %>% dplyr::summarize_at(dplyr::vars(quads, frac),
                                       list(~sum(., na.rm = TRUE)))

      kd <- get_kaya_data(r, quiet = TRUE) %>%
        dplyr::filter(none.na(E), year == y)
      if (nrow(kd) > 0) {
        expect_equal(fm$quads, kd$E, tolerance = 1E-2,
                     label = "Sum of primary energy sources",
                     expected.label = "Total primary energy consumption")
      }
      expect_equal(fm$frac, 1, tolerance = 1E-2,
                   label = "Sum of percentages",
                   expected.label = "100")
    }
  }
})

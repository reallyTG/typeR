library("rtimicropem")
library("lubridate")
#################################################################################################
context("clean_measures")
#################################################################################################
test_that("clean_measures outputs a micropem object", {
  data("micropemChai")
  clean_micropem <- clean_measures(micropem_object = micropemChai)
  expect_that(clean_micropem, is_a("micropem"))
  clean_micropem <- clean_measures(micropem_object = micropemChai,
                                        hepa_start = TRUE, hepa_end = TRUE)
  expect_that(clean_micropem, is_a("micropem"))
})

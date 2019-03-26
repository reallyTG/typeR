context("Check plant data summaries")

portal_data_path <- tempdir()

test_that("plant_abundance returns expected results", {
  skip_on_cran()
  plants_all <- plant_abundance(path = portal_data_path, level = "Plot", type = "All",
                                plots = "all", unknowns = TRUE,
                                correct_sp = FALSE, shape = "flat")
  plants_9698 <- dplyr::filter(plants_all, year %in% 1996:1998)
  expect_true(sum(plants_9698$abundance, na.rm = TRUE) == 88422)

  plants_erod <- plants_all %>%
    dplyr::filter(species == 'erod cicu', abundance > 0, year < 2017)
  expect_equal(max(plants_erod$abundance, na.rm = TRUE), 3369)
  expect_false(anyNA(plants_erod))
  expect_equal(nrow(plants_erod), 592)

  plants_fix_names <- plant_abundance(path = portal_data_path, level = "Plot", type = "All",
                                      plots = "all", unknowns = TRUE,
                                      correct_sp = TRUE, shape = "flat")
  expect_equal(sum(plants_all$abundance, na.rm = TRUE),
               sum(plants_fix_names$abundance, na.rm = TRUE))

})

test_that("shrub_cover returns expected results", {
  skip_on_cran()
  shrubs_all <- shrub_cover(path = portal_data_path, type = "Shrubs",
                                plots = "all", unknowns = FALSE,
                                correct_sp = FALSE)
  shrubs_9409 <- dplyr::filter(shrubs_all, year %in% 1994:2009)
  expect_true(round(mean(shrubs_9409$cover),4) == 0.0234)

  acacia <- shrubs_all %>%
    dplyr::filter(species == 'acac cons', year < 2017)
  expect_equal(round(max(acacia$cover),4), 0.4562)
  expect_false(anyNA(acacia$cover))
  expect_equal(nrow(acacia), 202)

  shrubs_fix_names <- shrub_cover(path = portal_data_path, type = "Shrubs",
                                      plots = "all", unknowns = FALSE,
                                      correct_sp = TRUE)
  expect_equal(round(mean(shrubs_all$cover),3),
               round(mean(shrubs_fix_names$cover),3))

})

context("Check seasonal data summaries")

portal_data_path <- tempdir()
rodents <- abundance(path = portal_data_path, level = "plot", shape = "flat")
test_rodents <- dplyr::filter(rodents, period %in% 21:191)

test_weather <- weather("monthly", path = portal_data_path) %>%
  dplyr::filter(year %in% 1989:2010)

test_that("add_seasons returns expected results", {

  rodent_seasons = add_seasons(test_rodents, level = "treatment", date_column = "period",
                               season_level = 2, path = portal_data_path)
  expect_true(expect_true(sum(rodent_seasons$abundance, na.rm = T) == 16452))

  rodent_seasons = add_seasons(test_rodents, level = "treatment", date_column = "period",
                               season_level = 2, summarize = "mean", path = portal_data_path)
  expect_true(expect_true(round(sum(rodent_seasons$abundance, na.rm = T), 4) == 478.3957))

  weather_seasons = add_seasons(test_weather, date_column = "yearmon",
                                season_level = 4, summarize = "mean", path = portal_data_path)
  expect_true(expect_true(round(sum(weather_seasons$precipitation, na.rm = T), 3) == 1788.509))

  })

test_that("yearly returns expected results", {

  rodent_yearly = yearly(test_rodents, level = "plot", date_column = "period", path = portal_data_path)
  expect_true(expect_true(round(sum(rodent_yearly$abundance, na.rm = T), 3) == 1533.19))

  weather_yearly = yearly(test_weather, date_column = "yearmon", path = portal_data_path)
  expect_true(expect_true(round(sum(weather_yearly$precipitation, na.rm = T), 4) == 453.3213))

})

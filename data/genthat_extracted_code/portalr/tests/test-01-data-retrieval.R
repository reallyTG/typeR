context("Check data retrieval")

portal_data_path <- tempdir()

test_that("download_observations and check_for_newer_data work", {
  skip_on_cran() # these download checks take a while to run
  expect_error(download_observations(portal_data_path, version = "1.20.0"), NA)
  expect_true(check_for_newer_data(portal_data_path))
  unlink(file.path(portal_data_path, "PortalData"), recursive = TRUE)

  expect_error(download_observations(portal_data_path, version = "1.6"), NA)
  expect_true(check_for_newer_data(portal_data_path))
  unlink(file.path(portal_data_path, "PortalData"), recursive = TRUE)

  expect_error(download_observations(portal_data_path, version = "1.5.9"))
  unlink(file.path(portal_data_path, "PortalData"), recursive = TRUE)

  expect_error(download_observations(portal_data_path, from_zenodo = TRUE), NA)
  expect_false(check_for_newer_data(portal_data_path))
  unlink(file.path(portal_data_path, "PortalData"), recursive = TRUE)

  expect_error(download_observations(portal_data_path), NA)
  expect_false(check_for_newer_data(portal_data_path))
  unlink(file.path(portal_data_path, "PortalData"), recursive = TRUE)
})

test_that("load_rodent_data downloads data if missing", {
  expect_error(data_tables <- load_rodent_data(portal_data_path, download_if_missing = FALSE))
  expect_warning(data_tables <- load_rodent_data(portal_data_path))
})

test_that("looking up data versions handle lack of a network connection", {
  without_internet({
    #expect_null(get_data_versions(from_zenodo = TRUE, halt_on_error = FALSE))
    #expect_error(get_data_versions(from_zenodo = TRUE, halt_on_error = TRUE),
    #             "^GET https://zenodo.org/record/1215988$")
    expect_null(get_data_versions(from_zenodo = FALSE, halt_on_error = FALSE))
    expect_error(get_data_versions(from_zenodo = FALSE, halt_on_error = TRUE),
                 "^GET https://api.github.com/repos/weecology/PortalData/releases\\?page=1$")
  })
})

test_that("load_rodent_data has the right format", {
  skip_on_cran()
  expect_error(data_tables <- load_rodent_data("repo"), NA)
  expect_equal(length(data_tables), 5)
  expect_equal(names(data_tables),
               c("rodent_data", "species_table", "trapping_table",
                 "newmoons_table", "plots_table"))

  data_tables <- load_rodent_data(portal_data_path)
  expect_equal(length(data_tables), 5)
  expect_equal(names(data_tables),
               c("rodent_data", "species_table", "trapping_table",
                 "newmoons_table", "plots_table"))
})

test_that("load_plant_data has the right format", {
  skip_on_cran()
  expect_error(data_tables <- load_plant_data("repo"), NA)
  expect_equal(length(data_tables), 7)
  expect_equal(names(data_tables),
               c("quadrat_data", "species_table", "census_table",
                 "date_table", "plots_table", "transect_data", "oldtransect_data"))

  expect_error(data_tables <- load_plant_data(portal_data_path), NA)
  expect_equal(length(data_tables), 7)
  expect_equal(names(data_tables),
               c("quadrat_data", "species_table", "census_table",
                 "date_table", "plots_table", "transect_data", "oldtransect_data"))
})

test_that("load_ant_data works", {
  skip_on_cran()
  expect_error(data_tables <- load_ant_data("repo"), NA)
  expect_equal(length(data_tables), 4)
  expect_equal(names(data_tables),
               c("bait_data", "colony_data", "species_table",
                 "plots_table"))

  expect_error(data_tables <- load_ant_data(portal_data_path), NA)
  expect_equal(length(data_tables), 4)
  expect_equal(names(data_tables),
               c("bait_data", "colony_data", "species_table",
                 "plots_table"))
})


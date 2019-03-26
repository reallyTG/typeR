context("Check rodent data summaries")

portal_data_path <- tempdir()

test_that("summarize_rodent_data returns expected results, and filters by plots correctly", {
  skip_on_cran()
  ab_all_plots <- summarize_rodent_data(path = portal_data_path, level = "plot",
                                  na_drop = TRUE)

  rodent_counts <- ab_all_plots %>%
    dplyr::filter(plot == 4) %>% dplyr::select(-treatment, -plot)

  ab_plot_4 <- summarize_rodent_data(path = portal_data_path, plots = 4,
                               na_drop = TRUE, zero_drop = FALSE)

  expect_equal(rodent_counts, ab_plot_4)

  rodent_counts <- ab_all_plots %>%
    dplyr::filter(plot %in% c(4, 8, 10, 12)) %>%
    dplyr::select(-treatment, -plot) %>%
    tidyr::gather(species, abundance, BA:SO) %>%
    dplyr::count(period, species, wt = abundance) %>%
    tidyr::spread(species, n)

  ab_plots_4_8_10_12 <- summarize_rodent_data(path = portal_data_path, plots = c(4, 8, 10, 12),
                               na_drop = TRUE, zero_drop = FALSE)

  expect_equal(rodent_counts, ab_plots_4_8_10_12)
})

test_that("summarize_rodent_data gives warning for using length", {
  skip_on_cran()
  expect_warning(dat <- summarize_rodent_data(path = portal_data_path, length = "all"))
  expect_equal(dat, summarize_rodent_data(path = portal_data_path, plots = "all"))
})

test_that("abundance returns expected results", {
  skip_on_cran()
  ab_notfilled <- abundance(path = portal_data_path, level = "Plot", type = "Rodents",
                            plots = "all", unknowns = FALSE,
                            shape = "flat", time = "period", fillweight = FALSE,
                            na_drop = FALSE, zero_drop = FALSE, min_traps = 1,
                            min_plots = 24, effort = FALSE)
  test_ab <- dplyr::filter(ab_notfilled, period %in% 400:450)
  expect_equal(nrow(test_ab), 25704)
  expect_true(sum(test_ab$abundance, na.rm = TRUE) == 10110)
  test_ab <- dplyr::filter(ab_notfilled, species == "DM", abundance > 0)
  expect_equal(max(test_ab$abundance, na.rm = TRUE), 17)
  expect_false(anyNA(test_ab))

  ab_filled <- abundance(path = portal_data_path, level = "Plot", type = "Rodents",
                         plots = "all", unknowns = FALSE,
                         shape = "flat", time = "period", fillweight = TRUE,
                         na_drop = FALSE, zero_drop = FALSE, min_traps = 1,
                         min_plots = 24, effort = FALSE)
  expect_equal(ab_notfilled, ab_filled)
})

test_that("biomass returns expected results", {
  skip_on_cran()
  biom_filled <- biomass(path = portal_data_path, level = "Plot", type = "Rodents",
                         plots = "all", unknowns = FALSE,
                         shape = "flat", time = "period", fillweight = TRUE,
                         na_drop = FALSE, zero_drop = FALSE, min_traps = 1,
                         min_plots = 24, effort = FALSE) %>%
    dplyr::filter(period %in% 400:450)

  biom_notfilled <- biomass(path = portal_data_path, level = "Plot", type = "Rodents",
                            plots = "all", unknowns = FALSE,
                            shape = "flat", time = "period", fillweight = FALSE,
                            na_drop = FALSE, zero_drop = FALSE, min_traps = 1,
                            min_plots = 24, effort = FALSE) %>%
    dplyr::filter(period %in% 400:450)

  expect_equal(nrow(biom_filled), 25704)
  expect_equal(dim(biom_filled), dim(biom_notfilled))
  expect_equal(biom_filled$species, biom_notfilled$species)
  expect_equal(floor(dplyr::filter(biom_notfilled, period == 447, plot == 3,
                                   species == "BA")$biomass), 15)
  expect_equal(floor(dplyr::filter(biom_filled, period == 447, plot == 3,
                                   species == "BA")$biomass), 24)
})

test_that("energy returns expected results", {
  skip_on_cran()
  energy_filled <- energy(path = portal_data_path, level = "Plot", type = "Rodents",
                          plots = "all", unknowns = FALSE,
                          shape = "flat", time = "period", fillweight = TRUE,
                          na_drop = FALSE, zero_drop = FALSE, min_traps = 1,
                          min_plots = 24, effort = FALSE) %>%
    dplyr::filter(period %in% 400:450)

  energy_notfilled <- energy(path = portal_data_path, level = "Plot", type = "Rodents",
                             plots = "all", unknowns = FALSE,
                             shape = "flat", time = "period", fillweight = FALSE,
                             na_drop = FALSE, zero_drop = FALSE, min_traps = 1,
                             min_plots = 24, effort = FALSE) %>%
    dplyr::filter(period %in% 400:450)

  expect_equal(nrow(energy_filled), 25704)
  expect_equal(dim(energy_filled), dim(energy_notfilled))
  expect_equal(energy_filled$species, energy_notfilled$species)
  expect_equal(floor(dplyr::filter(energy_notfilled, period == 447, plot == 3,
                                   species == "BA")$energy), 51)
  expect_equal(floor(dplyr::filter(energy_filled, period == 447, plot == 3,
                                   species == "BA")$energy), 82)
})

test_that("abundance filters at the plot level correctly", {
  skip_on_cran()
  incomplete_plots <- abundance(path = portal_data_path, level = "plot",
                                min_plots = 1, min_traps = 1, effort = TRUE) %>%
    dplyr::filter(ntraps < 1, period <= 463)
  expect_equal(NROW(incomplete_plots), 238)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot",
                                min_plots = 24, min_traps = 49, effort = TRUE) %>%
    dplyr::filter(ntraps < 1, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 1, min_traps = 1, effort = TRUE) %>%
    dplyr::filter(ntraps < 1, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 1, min_traps = 47, effort = TRUE) %>%
    dplyr::filter(ntraps < 47, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 1, min_traps = 49, effort = TRUE) %>%
    dplyr::filter(ntraps < 49, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 12, min_traps = 1, effort = TRUE) %>%
    dplyr::filter(ntraps < 1, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 12, min_traps = 47, effort = TRUE) %>%
    dplyr::filter(ntraps < 47, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 12, min_traps = 49, effort = TRUE) %>%
    dplyr::filter(ntraps < 49, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 24, min_traps = 1, effort = TRUE) %>%
    dplyr::filter(ntraps < 1, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 24, min_traps = 47, effort = TRUE) %>%
    dplyr::filter(ntraps < 47, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)

  incomplete_plots <- abundance(path = portal_data_path, level = "plot", na_drop = TRUE,
                                min_plots = 24, min_traps = 49, effort = TRUE) %>%
    dplyr::filter(ntraps < 49, period <= 463)
  expect_equal(NROW(incomplete_plots), 0)
})

context("TernPlot")

test_that("TernPlot: use", {
  skip_on_cran()
  set.seed(42)
  n_traits <- 3
  n_plots <- 10
  num_species <- 10
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 10,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  data_species <- x$traits
  data_abundances <- x$abundances
  data_abundances[1,9] <- 0
  data_abundances[1,10] <- 0

  O <- STEPCAM_ABC(data_abundances, data_species,
                   numParticles = 100, n_traits, plot_number = 1,
                   stopRate = 0.1, stop_at_iteration = 10, continue_from_file = FALSE)

  TernPlot(O);
  d <- cbind(O$DA, O$HF, O$LS);
  ternaryplot2(d, scale=1, col="black", grid=T, cex = 0.5, labels = c("inside"),
               dimnames = c("DA", "HF", "LS"), main="", coordinates = TRUE)

  ternaryplot2(d, scale=1, col="black", grid=T, cex = 0.5, labels = c("outside"),
               dimnames = c("DA", "HF", "LS"), main="", coordinates = TRUE,
               dimnames_position = "edge")

  ternaryplot2(d, scale=1, col="black", grid=T, cex = 0.5, labels = c("outside"),
               main="", coordinates = TRUE,
               dimnames_position = "edge")
})

test_that("TernPlot: abuse:", {
  skip_on_cran()
  set.seed(42)
  n_traits <- 3
  n_plots <- 10
  num_species <- 10
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 10,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  data_species <- x$traits
  data_abundances <- x$abundances
  data_abundances[1,9] <- 0
  data_abundances[1,10] <- 0

  O <- STEPCAM_ABC(data_abundances, data_species,
                   numParticles = 100, n_traits, plot_number = 1,
                   stopRate = 0.1, stop_at_iteration = 10, continue_from_file = FALSE)

  d <- cbind(O$DA, O$HF)

  expect_error(
  ternaryplot2(d, scale=1, col="black", grid=T, cex = 0.5, labels = c("inside"),
               dimnames = c("DA", "HF", "LS"), main="", coordinates = TRUE),
  "Need a matrix with 3 columns")

  d <- cbind(O$DA, O$HF, O$LS);
  d[1,1] <- -1
  expect_error(
    ternaryplot2(d, scale=1, col="black", grid=T, cex = 0.5, labels = c("inside"),
                 dimnames = c("DA", "HF", "LS"), main="", coordinates = TRUE),
    "X must be non-negative")
})

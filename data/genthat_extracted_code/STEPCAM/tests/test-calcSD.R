context("calcSD")

test_that("calcSD: use", {
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
  data_species$trait1 <- 1:10
  data_species$trait2 <- 1:10
  data_species$trait3 <- 1:10
  data_abundances <- x$abundances

  scaled_species <- scaleSpeciesvalues(data_species, n_traits)

  x <- calcSD(scaled_species,data_abundances, n_plots, n_traits)

  expect_equal(
    x[[1]] ,
    0
  )

  expect_equal(
    x[[2]],
    0
  )

  expect_equal(
    x[[4]],
    0
  )
})



test_that("calcSD: abuse", {
  skip_on_cran()
  set.seed(42)
  n_traits <- 3
  n_plots <- 10
  num_species <- 10
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 1,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  data_species <- x$traits
  data_species$trait1 <- c(runif(10,0,1))
  data_species$trait2 <- c(runif(10,0,1))
  data_species$trait3 <- c(runif(10,0,1))

  data_abundances <- x$abundances
  for(i in 1:8) {
    data_abundances[1,i] <- 1
  }

  for(i in 1:8) {
    for(j in 2:10) {
      if(runif(1,0,1) < 0.5) {
        data_abundances[i,j] <- 0
      }
    }
  }

  data_abundances[1,9] <- 1
  data_abundances[1,10] <- 0

  scaled_species <- scaleSpeciesvalues(data_species, n_traits)

  expect_error(
    calcSD(scaled_species, data_abundances, n_plots, n_traits),
    "One of your communities doesn't have species in it"
  )

  data_abundances[5,1] <- 1
  expect_error(
    calcSD(scaled_species, data_abundances, n_plots, n_traits),
    "One of your communities doesn't have at least three species in it in order to calculate summary statistics"
  )
})


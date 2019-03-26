context("generateValues")

test_that("generateValues: use", {
  skip_on_cran()
  params <- c(0,1,0)
  set.seed(42)
  n_traits <- 2
  n_plots <- 10
  x <- generate.Artificial.Data(n_species = 10, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 1,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  data_species <- x$traits
  data_species$trait1 <- c(rep(1,n_plots - 2), 2, 10)
  data_species$trait2 <- c(rep(1,n_plots - 2), 2, 10)

  data_abundances <- x$abundances
  data_abundances[1,4] <- 0
  community_number <- 1

  scaled_species  <- scaleSpeciesvalues(data_species,n_traits)
  data_frequencies <- generateFrequencies(data_abundances)

  abundances <- data_abundances
  row.names(abundances) <- c(1:n_plots)
  abundances2 <- as.data.frame(abundances)

  scaled_species <- as.data.frame(cbind(scaled_species[, c(1:(n_traits + 1))], data_frequencies)) ;
  traitnames <- names(data_species)[-1]
  names(scaled_species) <- c("sp", traitnames[1:n_traits], "freq")
  taxa <- nrow(scaled_species);
  row.names(scaled_species) <- c(1:taxa)

  expect_warning(
    v <- generateValues(params, scaled_species, data_abundances,
                      community_number, n_traits)
  )

  expect_equal(
    v[[4]],
    mean(scaled_species$trait1[1:9])
  )
  expect_equal(
    v[[5]],
    mean(scaled_species$trait2[1:9])
  )

  expect_equal(
    is.na(v[[2]]),
    TRUE
  )
})


test_that("generateValues: abuse", {
  skip_on_cran()
  params <- c(0,1,0)
  set.seed(42)
  n_traits <- 1
  n_plots <- 10
  x <- generate.Artificial.Data(n_species = 10, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 1,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  data_species <- x$traits
  data_species$trait1 <- c(rep(1,n_plots - 2), 2, 10)

  data_abundances <- x$abundances
  data_abundances[1,4] <- 0
  community_number <- 1

  scaled_species  <- scaleSpeciesvalues(data_species,n_traits)
  data_frequencies <- generateFrequencies(data_abundances)

  abundances <- data_abundances
  row.names(abundances) <- c(1:n_plots)
  abundances2 <- as.data.frame(abundances)

  scaled_species <- as.data.frame(cbind(scaled_species[, c(1:(n_traits + 1))], data_frequencies)) ;
  traitnames <- names(data_species)[-1]
  names(scaled_species) <- c("sp", traitnames[1:n_traits], "freq")
  taxa <- nrow(scaled_species);
  row.names(scaled_species) <- c(1:taxa)


  expect_error(
   generateValues(params, scaled_species, data_abundances,
                      community_number, n_traits),
   "need more than 1 trait"
  )
})

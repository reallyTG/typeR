context("STEPCAM")

test_that("STEPCAM: use",{
  skip_on_cran()
  set.seed(42)
  n_traits <- 1
  x <- generate.Artificial.Data(n_species = 10, n_traits = n_traits,
                                n_communities = 10,
                                occurence_distribution = 0.5,
                                average_richness = 1,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  data_species <- x$traits;
  data_species$trait1 <- 1:10
  data_species <- cbind(data_species,generateFrequencies(x$abundances))
  traitnames <- c("1")
  names(data_species) <- c("sp",traitnames[1:n_traits], "freq")
  data_abundances <- x$abundances;

  taxa <- nrow(data_species);
  community_number <- 1;
  n_traits <- 1;
  esppres <- which(data_abundances[community_number, ] > 0)
  S <- length(esppres);
  species_fallout <- 2

  a <- STEPCAM( c(0, species_fallout, 0), data_species, data_abudances,
                taxa, esppres, community_number, n_traits, species_fallout)

  expect_equal(
    a,
    c(1,1,1,1,1,1,1,1,0,0),
    tol=0.1
  )
  data_species <- x$traits
  data_species$trait1 <- c(1,1.1,2,3,4,5,6,7,7.8,8)
  data_species <- cbind(data_species,generateFrequencies(x$abundances))
  traitnames <- c("1")
  names(data_species) <- c("sp",traitnames[1:n_traits], "freq")

  species_fallout <- 2
  a <- STEPCAM( c(0,0,species_fallout), data_species, data_abudances,
                taxa, esppres, community_number,
                n_traits, species_fallout)
  expect_equal(
    a,
    c(1,0,1,1,1,1,1,1,0,1),
    tol=0.1
  )

  data_species <- x$traits
  data_species <- cbind(data_species,generateFrequencies(x$abundances))
  names(data_species) <- c("sp",traitnames[1:n_traits], "freq")
  data_species$freq <- rep(1,length(data_species$freq))
  data_species$freq[1] <- 0
  species_fallout <- 1
  a <- STEPCAM( c(species_fallout,0,0),
                data_species, data_abundances,
                taxa, esppres, community_number,
                n_traits, species_fallout)

  expect_equal(
    a,
    c(0,1,1,1,1,1,1,1,1,1),
    tol = 0.1
  )

})

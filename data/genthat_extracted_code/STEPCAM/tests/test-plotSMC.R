context("plotSMC")

test_that("plotSMC: use", {
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
  data_species$trait1 <- c(runif(8,0,1), 5, 10)
  data_species$trait2 <- c(runif(8,0,1), -10, 30)
  data_species$trait3 <- c(runif(8,0,1), -20, 40)

  data_abundances <- x$abundances
  for(i in 1:8) {
    data_abundances[1,i] <- 1
  }
  data_abundances[1,9] <- 0
  data_abundances[1,10] <- 0

  output <- STEPCAM_ABC(data_abundances, data_species,
                        numParticles = 100, n_traits, plot_number = 1,
                        stopRate = 0.1, stop_at_iteration = 3, continue_from_file = TRUE)

  local_path <- getwd()
  plotSMC(paste(local_path, "/", sep=""))
})

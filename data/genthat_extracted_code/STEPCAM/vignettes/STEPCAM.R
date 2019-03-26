## ------------------------------------------------------------------------
  library(STEPCAM)
  set.seed(42)
  simul_data <- generate.Artificial.Data(n_species = 10, n_traits = 3, n_communities = 10,
                                occurence_distribution = 0.5, average_richness = 0.8,
                                sd_richness = 0.25, mechanism_random = FALSE)

## ------------------------------------------------------------------------
  data_species <- simul_data$traits
  data_species$trait1 <- c(runif(8,0,1), 5, 10)
  data_species$trait2 <- c(runif(8,0,1), -10, 30)
  data_species$trait3 <- c(runif(8,0,1), -20, 40)

## ------------------------------------------------------------------------
  data_species

## ------------------------------------------------------------------------
  data_abundances <- simul_data$abundances
  for (i in 1:8) {
    data_abundances[1,i] <- 1
  }
  data_abundances[1,9] <- 0
  data_abundances[1,10] <- 0
  data_abundances

## ------------------------------------------------------------------------
  output <- STEPCAM_ABC(data_abundances, data_species,
                        numParticles = 100, n_traits = 3, plot_number = 1,
                        stopRate = 0.05, stop_at_iteration = 12, continue_from_file = FALSE)

## ------------------------------------------------------------------------
TernPlot(output)


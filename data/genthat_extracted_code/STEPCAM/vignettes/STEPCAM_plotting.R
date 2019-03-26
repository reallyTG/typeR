## ------------------------------------------------------------------------
  library(STEPCAM)
  set.seed(42)
  simul_data <- generate.Artificial.Data(n_species = 20, n_traits = 3, n_communities = 10,
                                       occurence_distribution = 2, average_richness = 0.6,
                                       sd_richness = 0.25, mechanism_random = FALSE)
  output <- STEPCAM_ABC(simul_data$abundances, simul_data$traits,
                        numParticles = 100, n_traits = 3, plot_number = 5,
                        stopRate = 0.1, stop_at_iteration = 8, continue_from_file = TRUE)

## ------------------------------------------------------------------------
TernPlot(output)

## ------------------------------------------------------------------------
plotSTEPCAM(output)

## ------------------------------------------------------------------------
plotSMC(paste(getwd(),"/",sep=""))


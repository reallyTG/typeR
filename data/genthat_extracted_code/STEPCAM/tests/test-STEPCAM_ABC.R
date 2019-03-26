context("STEPCAM_ABC")

test_that("STEPCAM_ABC: use", {
  skip_on_cran()
  set.seed(42)
  n_traits <- 3
  n_plots <- 10
  num_species <- 10
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 0.8,
                                sd_richness = 0.25,
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
                        stopRate = 0.05, stop_at_iteration = 12, continue_from_file = FALSE)

  v <- c(mean(output$DA), mean(output$HF), mean(output$LS))
  expect_equal(v, c(0,2,0), tolerance = 0.1)

  #clean up
  for (t in 0:20) {
    file_name <- paste("particles_t=", t, ".txt", sep="")
    if (file.exists(file_name)) {
      file.remove(file_name)
    }
  }
})

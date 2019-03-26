context("ABC_SMC")

test_that("ABC_SMC: use", {
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

  scaled_species <- scaleSpeciesvalues(data_species, n_traits)

  sd_vals <- calcSD(scaled_species, data_abundances, n_plots, n_traits)


  taxa <- nrow(data_species);

  Ord <- ordinationAxes(x = scaled_species, stand.x = FALSE)


  abundances <- data_abundances
  row.names(abundances) <- c(1:n_plots)
  data_frequencies <- generateFrequencies(data_abundances)

  scaled_species <- as.data.frame(cbind(scaled_species[, c(1:(n_traits + 1))], data_frequencies)) ;
  traitnames <- names(data_species)[-1]
  names(scaled_species) <- c("sp", traitnames[1:n_traits], "freq")
  row.names(scaled_species) <- c(1:taxa)

  params <- c(0,1,0)
  plot_number <- 1

  res <- detMnbsp(Ord, abundances)
  FD_output <- strippedDbFd(Ord, abundances, res[[1]], res[[2]])
  
  observed_traits <- scaled_species[, ] ; row.names(observed_traits) <- scaled_species[, 1]
  observed_abundances <- data_abundances[plot_number, ]
  present_species <- which(observed_abundances > 0)
  observed_traits <- observed_traits[present_species, ]
  observed_abundances <- observed_abundances[present_species]
  observed_presences <- observed_abundances ; observed_presences[1:length(observed_presences)] <- 1
  observed_traits <- observed_traits[, -1]
  trait_means <- c()
  traitvalues <- c()
  for(i in 1:n_traits){
    for(j in 1:length(observed_abundances)){
      traitvalues[j] <- observed_traits[j, i]
    }
    # calculate CTM value
    trait_means[i] <- mean(traitvalues)
  }
  # bind FD values and CTM together
  summary_stats <- cbind(FD_output$FRic[plot_number],
                         FD_output$FEve[plot_number],
                         FD_output$FDiv[plot_number],
                         t(trait_means)) # bind FD values and CTM together

  esppres <- which(data_abundances[plot_number, ] > 0) ;
  S <- length(esppres);
  species_fallout <- taxa - S

  numParticles <- 100
  plot_number <- 1
  stopRate <- 0.04

  output <- ABC_SMC(numParticles, species_fallout, taxa, esppres, n_traits,
                                sd_vals, summary_stats, community_number, scaled_species,
                                data_abundances, data_frequencies, stopRate, Ord,
                                continue_from_file = FALSE, stop_at_iteration = 8)

  v <- c(mean(output$DA),mean(output$HF),mean(output$LS))

  expect_equal(v, c(0,2,0), tolerance = 0.1)

  for (t in 0:20) {
    file_name <- paste("particles_t=", t, ".txt", sep="")
    if (file.exists(file_name)) {
      file.remove(file_name)
    }
  }
 ################################################################################################
 ################################################################################################
 ######################## Limiting Similarity test #############################################
 ################################################################################################
 ################################################################################################

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
  data_species$trait1 <- c(runif(10,0,5))
  data_species$trait2 <- c(runif(10,0,5))
  data_species$trait3 <- c(runif(10,0,5))
  data_species$trait1[10] <- data_species$trait1[9] + 0.00001
  data_species$trait2[10] <- data_species$trait2[9] + 0.00001
  data_species$trait3[10] <- data_species$trait3[9] + 0.00001


  data_abundances <- x$abundances


  for(i in 1:8) {
    for(j in 1:3) {
      data_abundances[i,j] <- 1
    }
    for(j in 4:10) {
      if(runif(1,0,1) < 0.5) {
        data_abundances[i,j] <- 1
      }
    }
  }
  for(i in 1:8) {
    data_abundances[1,i] <- 1
  }


  data_abundances[1,9] <- 0
  data_abundances[1,10] <- 1

  scaled_species <- scaleSpeciesvalues(data_species, n_traits)

  sd_vals <- calcSD(scaled_species, data_abundances, n_plots, n_traits)

  taxa <- nrow(data_species);

  Ord <- ordinationAxes(x = scaled_species, stand.x = FALSE)


  abundances <- data_abundances
  row.names(abundances) <- c(1:n_plots)
  data_frequencies <- generateFrequencies(data_abundances)

  scaled_species <- as.data.frame(cbind(scaled_species[, c(1:(n_traits + 1))], data_frequencies)) ;
  traitnames <- names(data_species)[-1]
  names(scaled_species) <- c("sp", traitnames[1:n_traits], "freq")
  row.names(scaled_species) <- c(1:taxa)

  params <- c(0,0,1)
  plot_number <- 1

  res <- detMnbsp(Ord, abundances)
  FD_output <- strippedDbFd(Ord, abundances, res[[1]], res[[2]])


  observed_traits <- scaled_species[, ] ; row.names(observed_traits) <- scaled_species[, 1]
  observed_abundances <- data_abundances[plot_number, ]
  present_species <- which(observed_abundances > 0)
  observed_traits <- observed_traits[present_species, ]
  observed_abundances <- observed_abundances[present_species]
  observed_presences <- observed_abundances ; observed_presences[1:length(observed_presences)] <- 1
  observed_traits <- observed_traits[, -1]
  trait_means <- c()
  traitvalues <- c()
  for(i in 1:n_traits){
    for(j in 1:length(observed_abundances)){
      traitvalues[j] <- observed_traits[j, i]
    }
    # calculate CTM value
    trait_means[i] <- mean(traitvalues)
  }
  # bind FD values and CTM together
  summary_stats <- cbind(FD_output$FRic[plot_number],FD_output$FEve[plot_number],FD_output$FDiv[plot_number], t(trait_means)) # bind FD values and CTM together

  esppres <- which(data_abundances[plot_number, ] > 0) ;
  S <- length(esppres);
  species_fallout <- taxa - S

  numParticles <- 100
  plot_number <- 1
  stopRate <- 0.0001

  for (t in 0:50) {
    file_name <- paste("particles_t=", t, ".txt", sep="")
    if (file.exists(file_name)) {
      file.remove(file_name)
    }
  }

  output <- ABC_SMC(numParticles, species_fallout, taxa, esppres, n_traits,
                    sd_vals, summary_stats, community_number, scaled_species,
                    data_abundances, data_frequencies, stopRate, Ord,
                    continue_from_file = FALSE, stop_at_iteration = 2)

  v <- c(mean(output$DA), mean(output$HF), mean(output$LS))
  expect_equal(v[[3]], 0.4, tolerance = 0.1)

  output <- ABC_SMC(numParticles, species_fallout, taxa, esppres, n_traits,
                    sd_vals, summary_stats, community_number, scaled_species,
                    data_abundances, data_frequencies, stopRate = 0.2, Ord,
                    continue_from_file = TRUE, stop_at_iteration = 20)

  v <- c(mean(output$DA), mean(output$HF), mean(output$LS))
  expect_equal(v[[3]], 1, tolerance = 0.2)

  for (t in 0:20) {
    file_name <- paste("particles_t=", t, ".txt", sep="")
    if (file.exists(file_name)) {
      file.remove(file_name)
    }
  }
})

test_that("ABC_SMC: abuse", {
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
  data_species$trait1 <- c(runif(10,0,1))
  data_species$trait2 <- c(runif(10,0,1))
  data_species$trait3 <- c(runif(10,0,1))
  data_species$trait1[10] <- data_species$trait1[9]
  data_species$trait2[10] <- data_species$trait2[9]
  data_species$trait3[10] <- data_species$trait3[9]


  data_abundances <- x$abundances
  for(i in 1:8) {
    data_abundances[1,i] <- 1
  }
  data_abundances[1,9] <- 1
  data_abundances[1,10] <- 0

  scaled_species <- scaleSpeciesvalues(data_species, n_traits)

  sd_vals <- calcSD(scaled_species, data_abundances, n_plots, n_traits)


  taxa <- nrow(data_species);

  Ord <- ordinationAxes(x = scaled_species, stand.x = FALSE)


  abundances <- data_abundances
  row.names(abundances) <- c(1:n_plots)
  data_frequencies <- generateFrequencies(data_abundances)

  scaled_species <- as.data.frame(cbind(scaled_species[, c(1:(n_traits + 1))], data_frequencies)) ;
  traitnames <- names(data_species)[-1]
  names(scaled_species) <- c("sp", traitnames[1:n_traits], "freq")
  row.names(scaled_species) <- c(1:taxa)

  params <- c(0,0,1)
  plot_number <- 1


  #summary_stats <- generateValues(params, scaled_species, data_abundances,
  #                                 plot_number, n_traits)

  res <- detMnbsp(Ord, abundances)
  FD_output <- strippedDbFd(Ord, abundances, res[[1]], res[[2]])
  
  
  observed_traits <- scaled_species[, ] ; row.names(observed_traits) <- scaled_species[, 1]
  observed_abundances <- data_abundances[plot_number, ]
  present_species <- which(observed_abundances > 0)
  observed_traits <- observed_traits[present_species, ]
  observed_abundances <- observed_abundances[present_species]
  observed_presences <- observed_abundances ; observed_presences[1:length(observed_presences)] <- 1
  observed_traits <- observed_traits[, -1]
  trait_means <- c()
  traitvalues <- c()
  for(i in 1:n_traits){
    for(j in 1:length(observed_abundances)){
      traitvalues[j] <- observed_traits[j, i]
    }
    # calculate CTM value
    trait_means[i] <- mean(traitvalues)
  }
  # bind FD values and CTM together
  summary_stats <- cbind(FD_output$FRic[plot_number],FD_output$FEve[plot_number],FD_output$FDiv[plot_number], t(trait_means)) # bind FD values and CTM together

  esppres <- which(data_abundances[plot_number, ] > 0) ;
  S <- length(esppres);
  species_fallout <- taxa - S

  numParticles <- 100
  plot_number <- 1
  stopRate <- 0.0001

  sd_vals <- round(sd_vals)
 expect_error(
  ABC_SMC(numParticles, species_fallout, taxa, esppres, n_traits,
                    sd_vals, summary_stats, community_number, scaled_species,
                    data_abundances, data_frequencies, stopRate, Ord,
                    continue_from_file = FALSE, stop_at_iteration = 5),
  "one of the community summary statistics shows no variation in your dataset")
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

 scaled_species <- scaleSpeciesvalues(data_species, n_traits)

 sd_vals <- calcSD(scaled_species, data_abundances, n_plots, n_traits)


 taxa <- nrow(data_species);

 Ord <- ordinationAxes(x = scaled_species, stand.x = FALSE)


 abundances <- data_abundances
 row.names(abundances) <- c(1:n_plots)
 data_frequencies <- generateFrequencies(data_abundances)

 scaled_species <- as.data.frame(cbind(scaled_species[, c(1:(n_traits + 1))], data_frequencies)) ;
 traitnames <- names(data_species)[-1]
 names(scaled_species) <- c("sp", traitnames[1:n_traits], "freq")
 row.names(scaled_species) <- c(1:taxa)

 params <- c(0,1,0)
 plot_number <- 1

 res <- detMnbsp(Ord, abundances)
 FD_output <- strippedDbFd(Ord, abundances, res[[1]], res[[2]])
 
 observed_traits <- scaled_species[, ] ; row.names(observed_traits) <- scaled_species[, 1]
 observed_abundances <- data_abundances[plot_number, ]
 present_species <- which(observed_abundances > 0)
 observed_traits <- observed_traits[present_species, ]
 observed_abundances <- observed_abundances[present_species]
 observed_presences <- observed_abundances ; observed_presences[1:length(observed_presences)] <- 1
 observed_traits <- observed_traits[, -1]
 trait_means <- c()
 traitvalues <- c()
 for(i in 1:n_traits){
   for(j in 1:length(observed_abundances)){
     traitvalues[j] <- observed_traits[j, i]
   }
   # calculate CTM value
   trait_means[i] <- mean(traitvalues)
 }
 # bind FD values and CTM together
 summary_stats <- cbind(FD_output$FRic[plot_number],
                        FD_output$FEve[plot_number],
                        FD_output$FDiv[plot_number],
                        t(trait_means)) # bind FD values and CTM together

 esppres <- which(data_abundances[plot_number, ] > 0) ;
 S <- length(esppres);
 species_fallout <- taxa - S

 numParticles <- 100
 plot_number <- 1
 stopRate <- 0.04

 expect_error(
   ABC_SMC(numParticles, species_fallout, taxa, esppres, n_traits,
                     sd_vals, summary_stats, community_number, scaled_species,
                     data_abundances, data_frequencies, stopRate, Ord,
                     continue_from_file = FALSE, stop_at_iteration = 1),
   "Can't stop at iteration 1 - please set stop_at_iteration to 2 if you only want to generate from the prior"
 )
})

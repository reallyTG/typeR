context("strippedDbFd")

test_that("strippedDbFd: use", {
  skip_on_cran()
  set.seed(42)
  n_traits <- 3
  n_plots <- 10
  num_species <- 10;
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 10,
                                sd_richness = 1,
                                mechanism_random = TRUE)

  data_species <- x$traits
  data_species$trait1 <- 1:10
  data_species$trait2 <- 1:10
  data_species$trait3 <- 1:10

  data_abundances <- x$abundances

  species  <- scaleSpeciesvalues(data_species,n_traits)
  abundances <- data_abundances


  row.names(abundances) <- c(1:n_plots)
  abundances2 <- as.data.frame(abundances)
  species2 <- species[,c(2:(n_traits + 1))] ;
  #species2 <- cbind(names(abundances2),species2)
  species2 <- as.matrix(species2)
  row.names(species2) <- names(abundances2)

  # calculate observed FD values
  FD_output1 <- FD::dbFD(species2, abundances2, stand.x = F,messages=FALSE)
  Ord <- ordinationAxes(x = species2, stand.x = FALSE)
  res <- detMnbsp(Ord, abundances2)
  FD_output2 <- strippedDbFd(Ord, abundances2, res[[1]], res[[2]])

  expect_equal (
    FD_output1$FRic,
    FD_output2$FRic,
    tolerance = 0.1
  )

  expect_equal (
    FD_output1$FEve,
    FD_output2$FEve,
    tolerance = 0.1
  )

  set.seed(666)
  n_traits <- 3
  n_plots <- 10
  num_species <- 10;
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 10,
                                sd_richness = 2,
                                mechanism_random = FALSE)

  species  <- scaleSpeciesvalues(x$traits,n_traits)
  abundances <- x$abundances


  row.names(abundances) <- c(1:n_plots)
  abundances2 <- as.data.frame(abundances)
  species2 <- species[,c(2:(n_traits + 1))] ;
  #species2 <- cbind(names(abundances2),species2)
  species2 <- as.matrix(species2)
  row.names(species2) <- names(abundances2)

  # calculate observed FD values
  FD_output1 <- FD::dbFD(species2, abundances2, stand.x = F,messages=FALSE)
  Ord <- ordinationAxes(x = species2, stand.x = FALSE)
  res <- detMnbsp(Ord, abundances2)
  FD_output2 <- strippedDbFd(Ord, abundances2, res[[1]], res[[2]])

  expect_equal (
    FD_output1$FRic,
    FD_output2$FRic,
    tolerance = 0.1
  )

  expect_equal (
    FD_output1$FEve,
    FD_output2$FEve,
    tolerance = 0.1
  )
  expect_equal (
    FD_output1$FDiv,
    FD_output2$FDiv,
    tolerance = 0.1
  )

  set.seed(666+42)
  n_traits <- 3
  n_plots <- 10
  num_species <- 10;
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.05,
                                average_richness = 0.3,
                                sd_richness = 0.1,
                                mechanism_random = FALSE)


  species  <- scaleSpeciesvalues(x$traits,n_traits)
  abundances <- x$abundances


  row.names(abundances) <- c(1:n_plots)
  abundances2 <- as.data.frame(abundances)
  species2 <- species[,c(2:(n_traits + 1))] ;
  #species2 <- cbind(names(abundances2),species2)
  species2 <- as.matrix(species2)
  row.names(species2) <- names(abundances2)

  # calculate observed FD values
  FD_output1 <- FD::dbFD(species2, abundances2, stand.x = F,messages=FALSE)
  Ord <- ordinationAxes(x = species2, stand.x = FALSE)
  res <- detMnbsp(Ord, abundances2)
  FD_output2 <- strippedDbFd(Ord, abundances2, res[[1]], res[[2]])

  expect_equal (
    FD_output1$FRic,
    FD_output2$FRic,
    tolerance = 0.1
  )

  expect_equal (
    FD_output1$FEve,
    FD_output2$FEve,
    tolerance = 0.1
  )
  expect_equal (
    FD_output1$FDiv,
    FD_output2$FDiv,
    tolerance = 0.1
  )
})

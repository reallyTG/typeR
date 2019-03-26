context("ordinationAxes")

test_that("ordinationAxes: use", {
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
  Ord <- ordinationAxes(x = species2, stand.x = FALSE)
  Ord <- ordinationAxes(x = species2, stand.x = TRUE)

  v2 <- species2[1,]
  v2[1:3] <- runif(3,0,1)
  Ord <- ordinationAxes(x = v2, stand.x = FALSE)

  v2[1:3] <- as.factor(c(1,1,2))
  expect_warning(
    v2 <- as.dist(v2)
  )
  expect_warning(
    Ord <- ordinationAxes(x = v2, stand.x = FALSE)
  )

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
  data_species$trait4 <- c(rep("blue",3),rep("red",2),rep("yellow",2),rep("black",3))
  n_traits <- 4

  # calculate observed FD values
  Ord <- ordinationAxes(x = data_species, stand.x = FALSE)

  set.seed(42)
  n_traits <- 1
  n_plots <- 10
  num_species <- 10;
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 10,
                                sd_richness = 1,
                                mechanism_random = TRUE)

  data_species <- x$traits
  data_species$trait1 <- c(rep("blue",3),rep("red",2),rep("yellow",2),rep("black",3))

  # calculate observed FD values
  Ord <- ordinationAxes(x = data_species, stand.x = FALSE)

  data_species$trait1 <- as.factor(data_species$trait1)
  Ord <- ordinationAxes(x = data_species, stand.x = FALSE)


  n_traits <- 1
  n_plots <- 10
  num_species <- 10;
  x <- generate.Artificial.Data(n_species = num_species, n_traits = n_traits,
                                n_communities = n_plots,
                                occurence_distribution = 0.5,
                                average_richness = 10,
                                sd_richness = 1,
                                mechanism_random = TRUE)

  data_species <- x$traits
  #data_species$trait1[4] <- NA
  v <- data_species$trait1
  names(v) <- data_species$species
  Ord <- ordinationAxes(x = v, stand.x = FALSE)
  
  v[4] <- NA
  Ord <-  ordinationAxes(x = v, stand.x = FALSE)

  #character vector
  v <-  c(rep("blue",3),rep("red",2),rep("yellow",2),rep("black",3))
  names(v) <- data_species$species
  expect_warning(
    Ord <-  ordinationAxes(x = v, stand.x = FALSE)
  )
  
  #character vector with one missing value
  v[4] <- NA
  expect_warning(
    Ord <-  ordinationAxes(x = v, stand.x = FALSE)
  )
  
  #vector factor
  v <- as.factor(v)
  expect_warning(
    Ord <-  ordinationAxes(x = v, stand.x = FALSE)
  )
  #with missing value
  v[4] <- NA
  expect_warning(
    Ord <-  ordinationAxes(x = v, stand.x = FALSE)
  )
  
  v <- data_species$trait1
  names(v) <- data_species$species
  v <- as.data.frame(v)
  Ord <-  ordinationAxes(x = v, stand.x = FALSE)

  v <- data_species$trait1
  names(v) <- data_species$species
  v <- as.data.frame(v)
  v$v <- c(rep("blue",3),rep("red",2),rep("yellow",2),rep("black",3))
  expect_warning(
    Ord <-  ordinationAxes(x = v, stand.x = FALSE)
  )

  v <- data_species$trait1
  names(v) <- data_species$species
  v <- as.data.frame(v)
  v$v <- c(rep("blue",3),rep("red",2),rep("yellow",2),rep("black",3))
  v$v <- as.factor(v$v)
  expect_warning(
    Ord <-  ordinationAxes(x = v, stand.x = FALSE)
  )
})


test_that("ordinationAxes: abuse", {
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
  data_abundances <- x$abundances
  
  species  <- scaleSpeciesvalues(data_species,n_traits)
  abundances <- data_abundances
  
  
  row.names(abundances) <- c(1:n_plots)
  abundances2 <- as.data.frame(abundances)
  species2 <- species[,c(2:(n_traits + 1))] ;
  #species2 <- cbind(names(abundances2),species2)
  species2 <- as.matrix(species2)
  row.names(species2) <- names(abundances2)
  
  #add some NA values
  species2[5,1] <- NA
  species2[7,2] <- NA
  expect_error(
    Ord <- ordinationAxes(x = species2, stand.x = FALSE)
  )
  
})

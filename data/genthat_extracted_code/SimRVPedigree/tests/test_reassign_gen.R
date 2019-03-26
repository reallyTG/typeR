context("reassign_gen")
test_that("reassign_gen returns a smaller or equally sized pedfile", {
  RVped <- sim_RVped(hazard_rates = hazard(AgeSpecific_Hazards),
                     GRR = 50, carrier_prob = 0.002,
                     RVfounder = TRUE,
                     FamID = 1,
                     num_affected = 2,
                     recall_probs = c(1),
                     founder_byears = c(1900, 1905),
                     ascertain_span = c(1980, 2015))[[2]]

  expect_gte(nrow(RVped), nrow(reassign_gen(RVped)))
})


test_that("maximum re-assigned gen is at most maximum gen from original pedigree ", {
  #simulate a nice, big pedigree. We will randomly assign affected status, so
  #using sim_ped to save time.
  n_gens <- 0
  while(n_gens < 8){
    ex_ped <- sim_ped(hazard_rates = hazard(hazardDF = AgeSpecific_Hazards),
                      RVfounder = FALSE,
                      GRR = 10,
                      FamID = 1,
                      founder_byears = c(1700, 1800),
                      stop_year = 2020)

    if (max(ex_ped$Gen) >= 8) {
      n_gens <- max(ex_ped$Gen)
    }
  }


  #assign affected status to randomly selected relatives
  n_affected <- sample(x = 2:5, size = 1)
  ex_ped$affected[ex_ped$available] = sample(x = c(rep(TRUE, n_affected),
                                                   rep(FALSE, (length(ex_ped$affected[ex_ped$available]) - n_affected))),
                                             size = length(ex_ped$affected[ex_ped$available]), replace = FALSE)

  expect_gte(max(ex_ped$Gen), max(reassign_gen(ex_ped)$Gen, na.rm = TRUE))
})


test_that("we never have two affected individuals with reassigned gen = 1", {
  #simulate a pedigree. Using sim_ped to save time, will manually assign affected status.
  gen1 <- FALSE
  while (gen1 == FALSE) {
    n_gens <- 0
    while(n_gens < 4){
      ex_ped <- sim_ped(hazard_rates = hazard(hazardDF = AgeSpecific_Hazards),
                        RVfounder = FALSE,
                        GRR = 10,
                        FamID = 1,
                        founder_byears = c(1800, 1900),
                        stop_year = 2020)

      if (max(ex_ped$Gen) >= 4) {
        n_gens <- max(ex_ped$Gen)
      }
    }
    #plot(ex_ped)

    #assign affected status to random pedigree members
    n_affected <- sample(x = 2:4, size = 1)
    ex_ped$affected[ex_ped$available] = sample(x = c(rep(TRUE, n_affected),
                                                     rep(FALSE, (length(ex_ped$affected[ex_ped$available]) - n_affected))),
                                               size = length(ex_ped$affected[ex_ped$available]), replace = FALSE)

    GenTab <- table(reassign_gen(ex_ped)$Gen)
    if ("1" %in% names(GenTab)) {
      gen1 = TRUE
    }
  }

  expect_equal(as.numeric(GenTab[which(names(GenTab) == 1)]), 1)
})


test_that("returns an error if at least two if the disease-affected relatives are not related", {
  #simulate a pedigree. Using sim_ped to save time, will manually assign affected status.
  n_gens <- 0
  while(n_gens < 4){
    ex_ped <- sim_ped(hazard_rates = hazard(hazardDF = AgeSpecific_Hazards),
                      RVfounder = FALSE,
                      GRR = 10,
                      FamID = 1,
                      founder_byears = c(1800, 1900),
                      stop_year = 2020)

    if (max(ex_ped$Gen) >= 4) {
      n_gens <- max(ex_ped$Gen)
    }
  }

  #randomly select two unrelated individuals to be our affecteds, and set them
  #to be available
  ex_ped$affected[ex_ped$available == FALSE] = sample(x = c(TRUE, TRUE,
                                                 rep(FALSE, (length(ex_ped$affected[ex_ped$available == FALSE]) - 2))),
                                           size = length(ex_ped$affected[ex_ped$available == FALSE]), replace = FALSE)

  ex_ped$available[ex_ped$affected] = TRUE

  expect_error(reassign_gen(ex_ped))
})

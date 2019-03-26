context("find_mcra")
test_that("If unrelated, find_mcra returns NA", {
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


  #randomly select two unrelated individuals
  UR_ids <- sample(ex_ped$ID[!ex_ped$available], size = 2)

  expect_true(is.na(find_mrca(ex_ped, UR_ids[1], UR_ids[2])))
})


test_that("If related, find_mcra returns at most two IDs", {
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

  #compute kinship matrix
  kin_mat <- kinship2::kinship(ped2pedigree(ex_ped))

  #find all combinations of related individuals
  related_index <- which(kin_mat != 0, arr.ind = T)
  related_index <- related_index[related_index[, 1] != related_index[, 2], ]

  #randomly select two related individuals
  test_ids <- ex_ped$ID[as.numeric(related_index[sample(1:nrow(related_index), size = 1), ])]

  expect_lte(length(find_mrca(ex_ped, test_ids[1], test_ids[2])), 2)
})


test_that("If related, find_mcra returns non-missing values", {
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

  #compute kinship matrix
  kin_mat <- kinship2::kinship(ped2pedigree(ex_ped))

  #find all combinations of related individuals
  related_index <- which(kin_mat != 0, arr.ind = T)
  related_index <- related_index[related_index[, 1] != related_index[, 2], ]

  #randomly select two related individuals
  test_ids <- ex_ped$ID[as.numeric(related_index[sample(1:nrow(related_index), size = 1), ])]


  # #randomly select two related individuals
  # test_ids <- sample(ex_ped$ID[ex_ped$available], size = 2)


  expect_true(!any(is.na(find_mrca(ex_ped, test_ids[1], test_ids[2]))))
})


test_that("If related, find_mcra returns an ID that is less than or equal to the IDS of the relative", {
  #NOTE: because of the manner in which pedigree members are added to the pedigree
  #the IDs of related individuals should always increase, therefore the mcra cannot
  #have an ID that is greater than either of the relatives
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

  #compute kinship matrix
  kin_mat <- kinship2::kinship(ped2pedigree(ex_ped))

  #find all combinations of related individuals
  related_index <- which(kin_mat != 0, arr.ind = T)
  related_index <- related_index[related_index[, 1] != related_index[, 2], ]

  #randomly select two related individuals
  test_ids <- ex_ped$ID[as.numeric(related_index[sample(1:nrow(related_index), size = 1), ])]


  # #randomly select two related individuals
  # test_ids <- sample(ex_ped$ID[ex_ped$available], size = 2)

  expect_lte(max(find_mrca(ex_ped, test_ids[1], test_ids[2])), min(test_ids))
})

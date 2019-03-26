context("ascertain_ped")

EXPed <- sim_RVped(hazard_rates = hazard(AgeSpecific_Hazards),
                   GRR = 35, carrier_prob = 0.002,
                   RVfounder = TRUE,
                   FamID = 1,
                   num_affected = 2,
                   recall_probs = c(1),
                   founder_byears = c(1900, 1910),
                   ascertain_span = c(1970, 2015))


test_that("ascertain_ped always returns TRUE for sim_RVped pedigrees", {
  expect_true(ascertain_ped(EXPed[[1]], num_affected = 2,
                            ascertain_span = c(1970, 2015),
                            recall_probs = c(1))[[1]])
})

test_that("ascertain_ped always a pedigree of size less than or equal to the original pedigree", {
  expect_lte(nrow(ascertain_ped(EXPed[[1]],
                                num_affected = 2,
                                ascertain_span = c(1970, 2015))[[2]]),
             nrow(EXPed[[1]]))
})


test_that("ascertained pedigrees meet number affected criteria", {
  exPed <- sim_ped(hazard_rates = hazard(AgeSpecific_Hazards),
                   GRR = 50, carrier_prob = 0.002,
                   RVfounder = TRUE, FamID = 1,
                   founder_byears = c(1900, 1910))
  my_n <- sample(x = c(1, 2, 3), size = 1)
  as <- sort(round(runif(2, 1970, 2010)))
  as[1] <- as[1] - 1

  aped <- ascertain_ped(exPed, num_affected = my_n, ascertain_span = as, recall_probs = c(1, 1, 0.5))
  my_ped <- aped[[2]][aped[[2]]$available == 1, ]

  if (aped[[1]]) {
    expect_true(sum(my_ped$affected) >= my_n)
    expect_true(length(which(my_ped$onsetYr >= as[1] & my_ped$onsetYr <= as[2])) > 0 )
    expect_true(my_ped$onsetYr[my_ped$proband == 1] >= as[1] & my_ped$onsetYr[my_ped$proband == 1] <= as[2])
  } else {
    expect_true(sum(my_ped$affected) < my_n | length(which(my_ped$onsetYr >= as[1] & my_ped$onsetYr <= as[2])) == 0)
  }
  })

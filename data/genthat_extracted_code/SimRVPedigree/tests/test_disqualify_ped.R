context("disqualify_ped")

test_that("peds with fewer than num_affected relatives or affecteds are discarded", {
  exPed <- sim_ped(hazard_rates = hazard(AgeSpecific_Hazards),
                   GRR = 50, carrier_prob = 0.002,
                   RVfounder = TRUE, FamID = 1,
                   founder_byears = c(1900, 1910))
  my_n <- sample(x = c(1, 2, 3), size = 1)
  as <- sort(round(runif(2, 1970, 2010)))
  as[1] <- as[1] - 1

  oy <- exPed$onsetYr[exPed$affected == 1]

  if (nrow(exPed) < my_n) {
    expect_true(disqualify_ped(exPed, num_affected = my_n,
                               ascertain_span = as,
                               first_diagnosis = NULL))
  }

  if (sum(exPed$affected) < my_n) {
    expect_true(disqualify_ped(exPed, num_affected = my_n,
                               ascertain_span = as,
                               first_diagnosis = NULL))
  }

  })



test_that("pedigrees must have members with appropriate onset years to be ascertained", {
  exPed <- sim_ped(hazard_rates = hazard(AgeSpecific_Hazards),
                   GRR = 50, carrier_prob = 0.002,
                   RVfounder = TRUE, FamID = 1,
                   founder_byears = c(1900, 1910))
  my_n <- sample(x = c(1, 2, 3), size = 1)
  as <- sort(round(runif(2, 1970, 2010)))
  as[1] <- as[1] - 1

  oy <- exPed$onsetYr[exPed$affected == 1]

  if (length(oy) < my_n) {
    #if pedigree has fewer than n members it will be discarded
    expect_true(disqualify_ped(exPed, num_affected = my_n,
                               ascertain_span = as,
                               first_diagnosis = NULL))
  } else if (length(oy) >= my_n & length(which(oy <= as[2])) < my_n) {
    #if pedigree has the requisite number of members, but not before end of
    #ascertainment span it will be discarded
    expect_true(disqualify_ped(exPed, num_affected = my_n,
                               ascertain_span = as,
                               first_diagnosis = NULL))
  } else if (length(oy) >= my_n
             & length(which(oy <= as[2])) >= my_n
             & length(which(oy >= as[1] & oy <= as[2])) < 1) {
    #if pedigree has the requisite number of members before end of ascertainment
    #span, but 1 during the ascertainment span it will be discarded
    expect_true(disqualify_ped(exPed, num_affected = my_n,
                               ascertain_span = as,
                               first_diagnosis = NULL))
  } else if (length(oy) >= my_n
             & length(which(oy <= as[2])) >= my_n
             & length(which(oy >= as[1] & oy <= as[2])) >= 1) {
    #if pedigree meets all criteria it will NOT be discarded
    expect_false(disqualify_ped(exPed, num_affected = my_n,
                                ascertain_span = as,
                                first_diagnosis = NULL))
  }
  })



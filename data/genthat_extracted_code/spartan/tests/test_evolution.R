library(spartan)
context("Test of Spartan Evolution Utilities")

test_that("emulator_parameter_evolution", {

  skip_on_cran()

  # Downloaded previously from website, should exist in workspace
  load("built_ensemble")



  #skip("Skipping")
  #load(file.path("built_ensemble_72.Rda"))
  parameters <- c("stableBindProbability","chemokineExpressionThreshold",
                  "initialChemokineExpressionValue","maxChemokineExpressionValue",
                  "maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")
  measures<-c("Velocity","Displacement","PatchArea")
  sampleMins <- c(0,0.1,0.1,0.015,0.1,0.25)
  sampleMaxes<- c(100,0.9,0.5,0.08,1.0,5.0)
  desiredResponses <- c(4.3,24)
  nsga2_user_set_parameters <- nsga2_set_user_params(built_ensemble, parameters, measures, desiredResponses, sampleMins, sampleMaxes)
  nsga2_settings <- list("popsize"=100,"generations" = 20, "cprob" = 0.3, "mprob" = 0.1)

  nsga2result <- emulator_parameter_evolution(evalfunction, nsga2_user_set_parameters, nsga2_settings)

  expect_equal(length(nsga2result),3)
  expect_equal(ncol(nsga2result$value),length(measures))
  expect_equal(nrow(nsga2result$value),nsga2_settings$popsize)

  # Check none are na
  expect_equal(sum(is.na(nsga2result)),0)

  rm(nsga2result, nsga2_settings, nsga2_user_set_parameters)

})

test_that("nsga2_set_user_params", {

  skip_on_cran()

  #skip("Skipping")
  #load(file.path("built_ensemble_72.Rda"))
  # Downloaded above, now load
  load("built_ensemble")

  parameters <- c("stableBindProbability","chemokineExpressionThreshold",
                  "initialChemokineExpressionValue","maxChemokineExpressionValue",
                  "maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")
  measures<-c("Velocity","Displacement","PatchArea")
  sampleMins <- c(0,0.1,0.1,0.015,0.1,0.25)
  sampleMaxes<- c(100,0.9,0.5,0.08,1.0,5.0)
  desiredResponses <- c(4.3,24)
  nsga2_user_set_parameters <- nsga2_set_user_params(built_ensemble, parameters, measures, desiredResponses, sampleMins, sampleMaxes)

  expect_equal(nsga2_user_set_parameters$lower.bounds, sampleMins)
  expect_equal(nsga2_user_set_parameters$upper.bounds, sampleMaxes)
  expect_equal(nsga2_user_set_parameters$emulator, built_ensemble)
  expect_equal(nsga2_user_set_parameters$parameters, parameters)
  expect_equal(nsga2_user_set_parameters$measures, measures)
  expect_equal(nsga2_user_set_parameters$desiredResponses, desiredResponses)

  # Can now remove the downloaded ensemble
  file.remove(file.path(getwd(),"built_ensemble"))
  file.remove(file.path(getwd(),"built_ensemble.zip"))

})

test_that("set.nsga_sensitivity_params", {

  #skip("Skipping")
  sens_params <- set.nsga_sensitivity_params(100, 0.1,0.1,500,1.0,1.0,500)

  expect_equal(sens_params$Generation_min,100)
  expect_equal(sens_params$Crossover_min,0.1)
  expect_equal(sens_params$Crossover_min,0.1)
  expect_equal(sens_params$Generation_max,500)
  expect_equal(sens_params$Crossover_max,1.0)
  expect_equal(sens_params$Mutation_max,1.0)
  expect_equal(sens_params$seed,500)
})

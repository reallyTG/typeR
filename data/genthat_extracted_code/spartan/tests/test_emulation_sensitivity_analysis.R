library(spartan)
context("Test of Spartan Emulation Sensitivity Analysis")

test_that("emulate_efast_sampled_parameters ", {

  skip_on_cran()

  ## This is the first test that utilises the ensemble, downloadable from online
  ## Download it here, and delete it on the final test that uses this object.
  # Saves downloading several times
  download.file("http://www.kieranalden.info/spartan/test_data/built_ensemble.zip", "built_ensemble.zip")
  # Load this in
  unzip("built_ensemble.zip")
  load("built_ensemble")


  #load("built_ensemble_72.Rda")
  dir.create(file.path(getwd(),"SA"))

  efast_generate_sample(file.path(getwd(),"SA"), 3,65, c("stableBindProbability","chemokineExpressionThreshold",
                                          "initialChemokineExpressionValue",
                                          "maxChemokineExpressionValue","maxProbabilityOfAdhesion",
                                          "adhesionFactorExpressionSlope", "dummy"), cbind(0,0.1,0.1,0.015,0.1,0.25,0), cbind(100,0.9,0.5,0.08,1,5,1))

  emulate_efast_sampled_parameters(file.path(getwd(),"SA"), built_ensemble,
                                   c("stableBindProbability","chemokineExpressionThreshold",
                                     "initialChemokineExpressionValue",
                                     "maxChemokineExpressionValue","maxProbabilityOfAdhesion",
                                     "adhesionFactorExpressionSlope","dummy"), c("Velocity","Displacement"),
                                   3, ensemble_set = TRUE, normalise = TRUE)

  expect_true(file.exists(file.path(getwd(),"SA","Curve1_Results_Summary.csv")))
  expect_true(file.exists(file.path(getwd(),"SA","Curve2_Results_Summary.csv")))
  expect_true(file.exists(file.path(getwd(),"SA","Curve3_Results_Summary.csv")))

  unlink(file.path(getwd(),"SA"),recursive = TRUE)

})

test_that("emulate_lhc_sampled_parameters", {

  skip_on_cran()

  data("emulated_lhc_values")

  # Downloaded previously from website, should exist in workspace
  load("built_ensemble")

  #load("built_ensemble_72.Rda")

  dir.create(file.path(getwd(),"SA"))

  predictions<-emulate_lhc_sampled_parameters(file.path(getwd(),"SA"), built_ensemble,
                                 c("stableBindProbability","chemokineExpressionThreshold",
                                   "initialChemokineExpressionValue",
                                   "maxChemokineExpressionValue","maxProbabilityOfAdhesion",
                                   "adhesionFactorExpressionSlope"), c("Velocity","Displacement"),
                                 c("microns","microns/min"), dataset = emulated_lhc_values, normalise = TRUE,
                                 write_csv_files = FALSE)

  expect_true(file.exists(file.path(getwd(),"SA","stableBindProbability_Velocity.png")))
  expect_true(file.exists(file.path(getwd(),"SA","chemokineExpressionThreshold_Velocity.png")))
  expect_true(file.exists(file.path(getwd(),"SA","initialChemokineExpressionValue_Velocity.png")))
  expect_true(file.exists(file.path(getwd(),"SA","maxChemokineExpressionValue_Velocity.png")))
  expect_true(file.exists(file.path(getwd(),"SA","maxProbabilityOfAdhesion_Velocity.png")))
  expect_true(file.exists(file.path(getwd(),"SA","adhesionFactorExpressionSlope_Velocity.png")))

  expect_true(file.exists(file.path(getwd(),"SA","stableBindProbability_Displacement.png")))
  expect_true(file.exists(file.path(getwd(),"SA","chemokineExpressionThreshold_Displacement.png")))
  expect_true(file.exists(file.path(getwd(),"SA","initialChemokineExpressionValue_Displacement.png")))
  expect_true(file.exists(file.path(getwd(),"SA","maxChemokineExpressionValue_Displacement.png")))
  expect_true(file.exists(file.path(getwd(),"SA","maxProbabilityOfAdhesion_Displacement.png")))
  expect_true(file.exists(file.path(getwd(),"SA","adhesionFactorExpressionSlope_Displacement.png")))

  # Expect error:
  expect_message(emulate_lhc_sampled_parameters(file.path(getwd(),"SA"), built_ensemble,
                                                c("stableBindProbability","chemokineExpressionThreshold",
                                                  "initialChemokineExpressionValue",
                                                  "maxChemokineExpressionValue","maxProbabilityOfAdhesion",
                                                  "adhesionFactorExpressionSlope"), c("Velocity","Displacement"),
                                                c("microns","microns/min"),dataset = NULL, ensemble_set = TRUE,
                                                normalise = FALSE,
                                               timepoint = NULL,
                                               timepointscale = NULL),"You must specify either an R object containing parameter values, or the name of a CSV file in the filepath containing parameter values")

  unlink(file.path(getwd(),"SA"),recursive = TRUE)
})

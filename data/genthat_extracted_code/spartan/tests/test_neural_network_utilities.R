library(spartan)
context("Test Neural Network Utilities")

test_that("determine_optimal_neural_network_structure", {

  skip_on_travis()
  skip_on_cran()
  # Outer test of function: to ensure we get some output from the inner functions tested below

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  # So change the default in the algorithm settings

  optimal_structure<- determine_optimal_neural_network_structure(partitionedData$training, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                                     "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"),
                                                         c("Velocity","Displacement","PatchArea"),
                                                         emulation_algorithm_settings(network_structures=list(c(4))))

  # Check structure
  expect_true(optimal_structure==4)

  file.remove(file.path(getwd(),"partitioned_data.Rda"))
})

test_that("kfoldCrossValidation", {

  skip_on_travis()
  skip_on_cran()

  # Test of k-fold cross validation calculations - inner functions are tested below

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  network_errors <- kfoldCrossValidation(partitionedData$training, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                    "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea"), emulation_algorithm_settings(network_structures=list(c(4),c(3))))

  expect_true(nrow(network_errors)==2)
  expect_true(ncol(network_errors)==4)
  expect_false(any(is.na(network_errors)))

  file.remove(file.path(getwd(),"partitioned_data.Rda"))
})

test_that("analysenetwork_structures", {

  skip_on_travis()
  skip_on_cran()

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  average_errors <- analysenetwork_structures((nrow(partitionedData$training) %/% 10), partitionedData$training,
                            generate_model_formula(c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                     "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea")),
                            c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                              "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea"),
                            emulation_algorithm_settings(network_structures=list(c(4),c(3))))

  expect_true(nrow(average_errors)==2)
  expect_true(ncol(average_errors)==4)
  expect_false(any(is.na(average_errors)))

  file.remove(file.path(getwd(),"partitioned_data.Rda"))
})


test_that("createAndEvaluateFolds", {

  skip_on_travis()
  skip_on_cran()

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  network_ms_errors <- createAndEvaluateFolds((nrow(partitionedData$training) %/% 10), 1, (nrow(partitionedData$training) %/% 10),
                                     partitionedData$training, c(4), generate_model_formula(c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                                              "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea")),
                         c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                           "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea"),
                         emulation_algorithm_settings(network_structures=list(c(4),c(3))))

  # Check structures:
  expect_true(nrow(network_ms_errors)==10)
  expect_true(ncol(network_ms_errors)==3)
  expect_false(any(is.na(network_ms_errors)))

  file.remove(file.path(getwd(),"partitioned_data.Rda"))
})

test_that("updateErrorForStructure", {

  skip_on_travis()
  skip_on_cran()

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  network_ms_errors <- createAndEvaluateFolds((nrow(partitionedData$training) %/% 10), 1, (nrow(partitionedData$training) %/% 10),
                                              partitionedData$training, c(4), generate_model_formula(c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                                                       "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea")),
                                              c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea"),
                                              emulation_algorithm_settings(network_structures=list(c(4),c(3))))

  updatedErrors <- updateErrorForStructure(network_ms_errors, c(4),
                                      NULL, c("Velocity","Displacement","PatchArea"))

  # Should have summarised into one error
  expect_true(nrow(updatedErrors)==1)
  expect_true(ncol(updatedErrors)==4)
  expect_false(any(is.na(updatedErrors)))

  file.remove(file.path(getwd(),"partitioned_data.Rda"))

})

test_that("select_suitable_structure", {

  skip_on_travis()
  skip_on_cran()

  # Test returns the expected lowest
  errors <- rbind(cbind("4","0.413503637996208","0.413503637996208","0.413503637996208"),
                  cbind("3","0.504658205549008","0.504658205549008","0.504658205549008"))

  expect_true(as.numeric(selectSuitableStructure(errors))==1)

  errors <- rbind(cbind("4","0.413503637996208","0.413503637996208","0.413503637996208"),
                  cbind("3","0.204658205549008","0.304658205549008","0.504658205549008"))

  expect_true(as.numeric(selectSuitableStructure(errors))==2)
})

test_that("calculate_fold_MSE", {

  skip_on_travis()
  skip_on_cran()


  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  train_fold <- createTrainingFold(1, 10, 1, (nrow(partitionedData$training) %/% 10), partitionedData$training)

  # Create the network
  nn <- create_neural_network(generate_model_formula(c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                       "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea")), train_fold, 1, partitionedData$training,
                              c(4),800000)

  # Can now use this neural network to test MSE
  test_fold<-createtest_fold(2, 10, 38, 60, partitionedData$training)
  nn_predictions <- neuralnet::compute(nn, test_fold[c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                       "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")])

  fold_ms_errors <- calculate_fold_MSE(nn_predictions, test_fold, nn,c("Velocity","Displacement","PatchArea"))

  # Need to add seed into partitioning and nn generation if we were to check correct values here
  expect_true(nrow(fold_ms_errors)==1)
  expect_true(ncol(fold_ms_errors)==3)
  expect_false(any(is.na(fold_ms_errors)))




})

test_that("createTrainingFold", {

  skip_on_travis()
  skip_on_cran()

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  fold <- createTrainingFold(1, 10, 1, (nrow(partitionedData$training) %/% 10), partitionedData$training)

  # Check fold structure
  expect_true(nrow(fold)==338)
  expect_true(ncol(fold)==9)
  expect_false(any(is.na(fold)))

  file.remove(file.path(getwd(),"partitioned_data.Rda"))


})

test_that("createTestFold", {

  skip_on_travis()
  skip_on_cran()

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5))

  fold<-createtest_fold(2, 10, 38, 60, partitionedData$training)

  # Check fold structure
  expect_true(nrow(fold)==23)
  expect_true(ncol(fold)==9)
  expect_false(any(is.na(fold)))

  file.remove(file.path(getwd(),"partitioned_data.Rda"))

})

# Test the overall method then:
test_that("create_neural_network", {

  skip_on_travis()
  skip_on_cran()

  data("sim_data_for_emulation")
  ## Partition the dataset, in this case normalising the data
  partitionedData <- partition_dataset(sim_data_for_emulation, c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                                 "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement"), percent_train=75, percent_test=15,
                                       percent_validation=10, normalise=TRUE, sample_mins = cbind(0,0.1,0.1,0.015,0.1,0.25), sample_maxes = cbind(100,0.9,0.5,0.08,1,5),seed=100)


  model_fit <- create_neural_network(generate_model_formula(c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                                                              "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope"), c("Velocity","Displacement","PatchArea")),
                                     partitionedData$training,
                                     NULL, partitionedData, 4,
                                     800000)

  expect_true(length(model_fit)==13)
  expect_true(nrow(model_fit$net.result[[1]])==375)
  expect_true(ncol(model_fit$net.result[[1]])==3)

})

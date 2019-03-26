context("mcfs")

#devtools::use_testthat()
#devtools::use_test("test.mcfs")

test_that("MCFS artificial data M5", {
  options(java.parameters = "-Xmx4g")
  require(testthat)
  require(rmcfs)
  
  ####################################
  ######### Artificial data ##########
  ####################################

  # create input data and review it
  adata <- artificial.data(rnd_features = 100, seed = 1)
  showme(adata)
  adata$class <- as.numeric(factor(adata$class))
  
  # Parametrize and run MCFS-ID procedure
  result <- mcfs(class~., adata, cutoffPermutations = 0, featureFreq = 20,
                 buildID = TRUE, finalCV = TRUE, finalRuleset = FALSE, 
                 threadsNumber = 1, seed = 1)
  
  expect_that(result, is_a("mcfs"))
  expect_that(all(c('RI','ID') %in% names(result)), is_true())
  expect_that(result$params$mcfs.cutoffPermutations, equals(0))
  expect_that(result$cutoff_value, equals(9))
  expect_that(nrow(result$distances), equals(20))
  expect_that(nrow(result$RI), equals(106))
  expect_that(nrow(result$distances), equals(20))
})


context("Unit test for the functionality of the extractSubTree() function")
test_that("pacotestExtractSubTreeDim5", {
  
  set.seed(3.141)
  d = 5
  families = 3:5
  parametersRange = c(3,8)
  
  # Generate random R-vine structure
  rvmMatrix = VineCopula::RVineMatrixSample(d, 1, naturalOrder = T)
  
  rvmFamilies = matrix(sample(families, d*d, replace=T), d, d)
  rvmFamilies[upper.tri(rvmFamilies,diag=T)]= 0
  
  rvmParameters = matrix(runif(d*d, parametersRange[1], parametersRange[2]), d, d)
  rvmParameters[upper.tri(rvmParameters,diag=T)]= 0
  
  rvm = VineCopula::RVineMatrix(rvmMatrix[[1]], rvmFamilies, rvmParameters)
  
  n = 503
  rvmDataFull = VineCopula::RVineSim(n, rvm)
  
  rvmHatFull = VineCopula::RVineSeqEst(rvmDataFull, rvm)
  
  
  for (tree in 2:(d-1))
  {
    for (copulaNumber in 1:(d-tree))
    {
      xx = pacotest:::extractSubTree(rvmHatFull, tree, copulaNumber, rvmDataFull)
      
      subRvmHat = xx$RVM
      dataInd = rvm$Matrix[c(d-tree+1-copulaNumber,(d-tree+1):d),(d-tree+1-copulaNumber)]
      dataInd = sort(dataInd)
      
      subRvmHatEstimated = VineCopula::RVineSeqEst(rvmDataFull[, dataInd], subRvmHat)
      
      expect_equal(subRvmHatEstimated$par, subRvmHat$par, tolerance = 1e-4)
    }
    
  }
  
})



test_that("pacotestExtractSubTreeDim9", {
  
  set.seed(4)
  d = 9
  families = 3:5
  parametersRange = c(3,8)
  
  # Generate random R-vine structure
  rvmMatrix = VineCopula::RVineMatrixSample(d, 1, naturalOrder = T)
  
  rvmFamilies = matrix(sample(families, d*d, replace=T), d, d)
  rvmFamilies[upper.tri(rvmFamilies,diag=T)]= 0
  
  rvmParameters = matrix(runif(d*d, parametersRange[1], parametersRange[2]), d, d)
  rvmParameters[upper.tri(rvmParameters,diag=T)]= 0
  
  rvm = VineCopula::RVineMatrix(rvmMatrix[[1]], rvmFamilies, rvmParameters)
  
  n = 2500
  rvmDataFull = VineCopula::RVineSim(n, rvm)
  
  rvmHatFull = VineCopula::RVineSeqEst(rvmDataFull, rvm)
  
  
  for (tree in 2:(d-1))
  {
    for (copulaNumber in 1:(d-tree))
    {
      xx = pacotest:::extractSubTree(rvmHatFull, tree, copulaNumber, rvmDataFull)
      
      subRvmHat = xx$RVM
      dataInd = rvm$Matrix[c(d-tree+1-copulaNumber,(d-tree+1):d),(d-tree+1-copulaNumber)]
      dataInd = sort(dataInd)
      
      subRvmHatEstimated = VineCopula::RVineSeqEst(rvmDataFull[, dataInd], subRvmHat)
      
      expect_equal(subRvmHatEstimated$par, subRvmHat$par, tolerance = 1e-4)
    }
    
  }
  
})

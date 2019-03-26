expect_knockMatch = function(X, Xk, tolMeans=1e-2, tolCorr=1e-3) {
  p = dim(X)[2]
  
  # Check that column means match
  mean_X = colMeans(X)
  mean_Xk = colMeans(Xk)
  testthat::expect_equal(mean_X, mean_Xk, tolerance=tolMeans)
  
  # Check that internal column correlations match
  corrX = sapply(1:(p-1), function(i) cor(X[,i],X[,i+1]))
  corrXk = sapply(1:(p-1), function(i) cor(Xk[,i],Xk[,i+1]))
  testthat::expect_equal(corrX, corrXk, tolerance=tolCorr)
  
  # Check that cross column correlations match
  corrXkX = sapply(1:(p-1), function(i) cor(X[,i],Xk[,i+1]))
  testthat::expect_equal(corrX, corrXkX, tolerance=tolCorr)
}
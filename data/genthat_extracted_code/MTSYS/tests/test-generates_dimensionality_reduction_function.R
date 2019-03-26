context("generates_dimensionality_reduction_function for RT method works 
         correctly")

test_that("generates_dimensionality_reduction_function", {
  
  # 40 data for versicolor in the iris dataset                            
  iris_versicolor <- iris[61:100, -5]
  
  # 10 data for each kind (setosa, versicolor, virginica) in the iris dataset                         
  iris_test <- iris[c(1:10, 51:60, 101:111), -5]
  
  reduces_dimensionality <- 
                    generates_dimensionality_reduction_function(iris_versicolor)
  
  calculated_Ys <- reduces_dimensionality(iris_test)
  attr(calculated_Ys,"dimnames") <- NULL
  attr(calculated_Ys,"scaled:center") <- NULL
  
  correct_Ys <- matrix(c(-0.259, -0.301, -0.318, -0.318, -0.264, -0.188, -0.309, 
                         -0.267, -0.353, -0.291, 0.159, 0.091, 0.161, -0.073, 
                         0.089, 0.002, 0.101, -0.18, 0.099, -0.089, 0.209, 
                         0.061, 0.257, 0.149, 0.195, 0.352, -0.079, 0.292, 
                         0.183, 0.315, 0.152, 1.244, 1.05, 1.115, 0.986, 
                         1.263, 1.282, 1.116, 1.154, 0.924, 1.059, -0.036, 
                         -0.061, -0.143, -0.048, -0.079, -0.011, 0.011, -0.061, 
                         -0.074, -0.011, 0.671, 0.337, 0.324, 0.348, 0.46, 
                         0.507, 0.338, 0.433, 0.46, 0.425, 0.149), ncol = 2)

  expect_equal(round(calculated_Ys, 3), correct_Ys)  
  
})


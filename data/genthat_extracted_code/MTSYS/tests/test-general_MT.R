context("general_MT and general_diagnosis.MT work correctly")

test_that("general_MT", {
  
  # 40 data for versicolor in the iris dataset                            
  iris_versicolor <- iris[61:100, -5] 
  
  unit_space <- general_MT(unit_space_data = iris_versicolor, 
                           generates_transform_function = 
                                               generates_normalization_function,
                           calc_A = function(x) solve(cor(x)),  
                           includes_transformed_data = TRUE)
  
  correct_distance <- c(1.351, 0.802, 1.164, 0.643, 1.122, 1.184, 0.910, 1.224, 
                        1.691, 0.547, 1.413, 0.692, 1.151, 1.292, 0.771, 0.982, 
                        1.092, 1.116, 0.487, 0.976, 0.621, 0.776, 0.423, 1.324, 
                        1.188, 1.161, 0.959, 1.136, 0.721, 0.685, 1.094, 0.584, 
                        0.310, 1.109, 0.430, 0.982, 0.488, 0.524, 1.572, 0.297)
  
  expect_equal(round(as.vector(unit_space$distance), 3), correct_distance)
  
})

test_that("general_diagnosis.MT without passing newdata", {
  
  # 40 data for versicolor in the iris dataset                            
  iris_versicolor <- iris[61:100, -5] 
  
  unit_space <- general_MT(unit_space_data = iris_versicolor, 
                           generates_transform_function = 
                                               generates_normalization_function,
                           calc_A = function(x) solve(cor(x)),  
                           includes_transformed_data = TRUE)
  
  diagnosis <- general_diagnosis.MT(unit_space = unit_space,  
                                    threshold = 4,
                                    includes_transformed_newdata = TRUE)
  
  correct_distance <- c(1.351, 0.802, 1.164, 0.643, 1.122, 1.184, 0.910, 1.224, 
                        1.691, 0.547, 1.413, 0.692, 1.151, 1.292, 0.771, 0.982, 
                        1.092, 1.116, 0.487, 0.976, 0.621, 0.776, 0.423, 1.324, 
                        1.188, 1.161, 0.959, 1.136, 0.721, 0.685, 1.094, 0.584, 
                        0.310, 1.109, 0.430, 0.982, 0.488, 0.524, 1.572, 0.297)
  
  expect_equal(round(as.vector(diagnosis$distance), 3), correct_distance)
  
})

test_that("general_diagnosis.MT with passing newdata", {
  
  # 40 data for versicolor in the iris dataset                            
  iris_versicolor <- iris[61:100, -5] 
  
  unit_space <- general_MT(unit_space_data = iris_versicolor, 
                           generates_transform_function = 
                                               generates_normalization_function,
                           calc_A = function(x) solve(cor(x)),  
                           includes_transformed_data = TRUE)
  
  correct_distance <- c(1.351, 0.802, 1.164, 0.643, 1.122, 1.184, 0.910, 1.224, 
                        1.691, 0.547, 1.413, 0.692, 1.151, 1.292, 0.771, 0.982, 
                        1.092, 1.116, 0.487, 0.976, 0.621, 0.776, 0.423, 1.324, 
                        1.188, 1.161, 0.959, 1.136, 0.721, 0.685, 1.094, 0.584, 
                        0.310, 1.109, 0.430, 0.982, 0.488, 0.524, 1.572, 0.297)
  
  # 10 data for each kind (setosa, versicolor, virginica) in the iris dataset                         
  iris_test <- iris[c(1:10, 51:60, 101:111), -5]
                          
  diagnosis <- general_diagnosis.MT(unit_space = unit_space, 
                                    newdata = iris_test, 
                                    threshold = 4,
                                    includes_transformed_newdata = TRUE)
  
  correct_distance <- c(5.061, 4.270, 4.561, 4.262, 5.186, 5.225, 4.590, 4.806, 
                        4.017, 4.552, 1.483, 0.870, 1.152, 1.027, 0.819, 0.839, 
                        0.925, 1.144, 0.996, 1.129, 3.375, 2.138, 2.268, 1.758, 
                        2.566, 2.745, 2.403, 2.452, 2.254, 3.029, 1.872)
  
  
  expect_equal(round(as.vector(diagnosis$distance), 3), correct_distance)
  
})

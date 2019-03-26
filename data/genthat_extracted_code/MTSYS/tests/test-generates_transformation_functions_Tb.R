context("generates_transformation_functions_Tb works correctly")

test_that("generates_transformation_functions_Tb", {

  tmp <- generates_transformation_functions_Tb(stackloss[-c(2, 12, 19), ])
  center_subtraction_function <- tmp[[1]]
  subtracts_ys <- tmp[[2]]
  adds_M_0 <- tmp[[3]]

  transformed_data <- center_subtraction_function(stackloss[-c(2, 12, 19), -4])
  derived_center <- attr(transformed_data, "scaled:center")
  calculated_M <- subtracts_ys(stackloss[-c(2, 12, 19), 4])
  M_0 <- adds_M_0(0)

  correct_center <- c(50, 18, 72)
  correct_M <- cbind(
                c(35, 30, 21, 11, 11, 12, 13, 8, 7, 7, 4, 5, 1,  0, 1, 1, 8, 8),
                c(34, 29, 20, 10, 10, 11, 12, 7, 6, 6, 3, 4, 0, -1, 0, 0, 7, 7),
                c(34, 29, 20, 10, 10, 11, 12, 7, 6, 6, 3, 4, 0, -1, 0, 0, 7, 7))
  correct_M_0 <- 7.47

  expect_equal(derived_center, correct_center)
  expect_equal(calculated_M, correct_M)
  expect_equal(round(M_0, 2), correct_M_0)

})


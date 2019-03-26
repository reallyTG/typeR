context("general_T and general_forecasting.T work correctly")

test_that("general_T", {

  # The value of the dependent variable of the following samples mediates
  # in the stackloss dataset.
  stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

  # The following samples are data other than the unit space data and the test
  # data.
  stackloss_signal <- stackloss[-c(2, 9, 10, 11, 12, 19, 20, 21), ]

  # The following settings are same as the T1 method.
  model <- general_T(unit_space_data = stackloss_center,
                     signal_space_data = stackloss_signal,
                     generates_transform_functions =
                                          generates_transformation_functions_T1,
                     subtracts_V_e = TRUE,
                     includes_transformed_data = TRUE)

  correct_M_hat <- c(26.750, 19.845, 8.668, 5.258, 6.963, 9.080, 9.080, -4.755,
                     -2.296, -9.977, -10.183, -9.438, -8.958)

  expect_equal(round(as.vector(model$M_hat), 3), correct_M_hat)

})

test_that("general_forecasting.T without passing newdata", {

  # The value of the dependent variable of the following samples mediates
  # in the stackloss dataset.
  stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

  # The following samples are data other than the unit space data and the test
  # data.
  stackloss_signal <- stackloss[-c(2, 9, 10, 11, 12, 19, 20, 21), ]

  # The following settings are same as the T1 method.
  model <- general_T(unit_space_data = stackloss_center,
                     signal_space_data = stackloss_signal,
                     generates_transform_functions =
                                          generates_transformation_functions_T1,
                     subtracts_V_e = TRUE,
                     includes_transformed_data = TRUE)

  forecasting <- general_forecasting.T(model = model,
                                       includes_transformed_newdata = TRUE)

  correct_M_hat <- c(26.750, 19.845, 8.668, 5.258, 6.963, 9.080, 9.080, -4.755,
                     -2.296, -9.977, -10.183, -9.438, -8.958)

  expect_equal(round(as.vector(forecasting$M_hat), 3), correct_M_hat)

})

test_that("general_forecasting.T with passing newdata", {

  # The value of the dependent variable of the following samples mediates
  # in the stackloss dataset.
  stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

  # The following samples are data other than the unit space data and the test
  # data.
  stackloss_signal <- stackloss[-c(2, 9, 10, 11, 12, 19, 20, 21), ]

  # The following settings are same as the T1 method.
  model <- general_T(unit_space_data = stackloss_center,
                     signal_space_data = stackloss_signal,
                     generates_transform_functions =
                                          generates_transformation_functions_T1,
                     subtracts_V_e = TRUE,
                     includes_transformed_data = TRUE)

  # The following test samples are chosen casually.
  stackloss_test <- stackloss[c(2, 12, 19), -4]

  forecasting <- general_forecasting.T(model = model,
                                       newdata = stackloss_test,
                                       includes_transformed_newdata = TRUE)

  correct_y_hat <- c(41.281,8.552, 7.416)

  expect_equal(round(as.numeric(forecasting$y_hat), 3), correct_y_hat)

})

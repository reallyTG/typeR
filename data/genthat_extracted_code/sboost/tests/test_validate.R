context("Validation")

numval <- validate(malware[-1], malware[1], 5, 4, 1)
catval <- validate(mushrooms[-1], mushrooms[1], 5, 4, "p")

test_that("Arguments are properly used.", {
  expect_equal(nrow(numval$training_summary_statistics), 5)
  expect_equal(nrow(catval$training_summary_statistics), 5)

  expect_equal(length(numval$classifier_list), 4)
  expect_equal(length(catval$classifier_list), 4)
})

test_that("Statistics are generated properly.", {
  expect_equal(
    round(numval$performance, digits = 5),
    data.frame(
      training_mean = c(1359.8, 566.2, 3038, 733.4, 0.77190, 0.70608, 0.80553, 0.64963, 0.84290, 0.67667),
      training_sd = c(1.64317, 19.61377, 22.95648, 7.79744, 0.00370, 0.00694, 0.00236, 0.00233, 0.00554, 0.00328),
      testing_mean = c(453.6, 194.4, 1007.4, 243.6, 0.76935, 0.70053, 0.80523, 0.65067, 0.83821, 0.67454),
      testing_sd = c(2.50998, 19.34683, 22.97390, 7.86130, 0.01118, 0.02055, 0.00726, 0.00720, 0.01642, 0.00995),
      row.names = c("true_positive", "false_negative", "true_negative", "false_positive", "accuracy",
                    "sensitivity", "specificity", "ppv", "npv", "f1")))
  expect_equal(
    round(catval$performance, digits = 5),
    data.frame(
      training_mean = c(3009.6, 75, 2423.2, 584.6, 0.89173, 0.97613, 0.84045, 0.88643, 0.95532, 0.91250),
      training_sd = c(681.20687, 56.88585, 1085.61167, 1284.96140, 0.21417, 0.01850, 0.34846, 0.24751, 0.04723, 0.17150),
      testing_mean = c(702.2, 129, 1094.8, 105, 0.88479, 0.90772, 0.8, 0.93128, 0.74840, 0.91908),
      testing_sd = c(572.88411, 214.03738, 852.36448, 234.78714, 0.21970, 0.13885, 0.44721, 0.15366, 0.43038, 0.14511),
      row.names = c("true_positive", "false_negative", "true_negative", "false_positive", "accuracy",
                    "sensitivity", "specificity", "ppv", "npv", "f1")))
})

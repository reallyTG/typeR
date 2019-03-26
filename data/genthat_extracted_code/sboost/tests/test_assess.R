context("Assessment")

num <- sboost(malware[-1], malware[1], 5, 1)
cat <- sboost(mushrooms[-1], mushrooms[1], 5, "p")

numass <- assess(num, malware[-1], malware[1], include_scores = TRUE)
catass <- assess(cat, mushrooms[-1], mushrooms[1], include_scores = TRUE)

test_that("Assessments are correct.", {
  expect_equal(round(numass$performance, digits = 5),
               c(true_positive = 1815, false_negative = 759, true_negative = 4045, false_positive = 978,
                 prevalence = 0.33882, accuracy = 0.77136, sensitivity = 0.70513, specificity = 0.80530,
                 ppv = 0.64984, npv = 0.84201, f1 = 0.67636))
  expect_equal(round(catass$performance, digits = 5),
               c(true_positive = 3796, false_negative = 120, true_negative = 4208, false_positive = 0,
                 prevalence = 0.48203, accuracy = 0.98523, sensitivity = 0.96936, specificity = 1,
                 ppv = 1, npv = 0.97227, f1 = 0.98444))

  expect_equal(round(colMeans(numass$feature_scores), digits = 5),
               c(X195 = -0.17693, X356 = -0.32453, X148 = 0.12680, X290 = -0.21707, X250 = 0.10246))
  expect_equal(round(colMeans(catass$feature_scores), digits = 5),
               c(odor = -0.17733, spore_print_color = 0.00973, population = 0.49892))
})

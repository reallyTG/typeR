context("Prediction")

num <- sboost(malware[-1], malware[1], 5, 1)
cat <- sboost(mushrooms[-1], mushrooms[1], 5, "p")

numpred <- data.frame(pred = predict(num, malware[-1]), scores = predict(num, malware[-1], scores = TRUE))
catpred <- data.frame(pred = predict(cat, mushrooms[-1]), scores = predict(cat, mushrooms[-1], scores = TRUE))

test_that("Predictions are correct.", {
  expect_equal(unique(numpred$pred), c(0, 1))
  expect_equal(as.vector(unique(catpred$pred)), c("p", "e"))

  expect_equal(as.vector(table(numpred$pred)), c(4804, 2793))
  expect_equal(as.vector(table(catpred$pred)), c(4328, 3796))

  expect_equal(round(mean(numpred$scores), digits = 5), -0.48927)
  expect_equal(round(mean(catpred$scores), digits = 5), 0.33131)
})

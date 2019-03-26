if(require(testthat) & require(kernlab)){
   context("Building supervised PRIM models")
   # Predict if the species is "setosa" or not on the iris dataset
   # Prepare a train and test set
   data(iris)
   irisData <- iris
   set.seed(552)
   trainIndex <- sample(1:nrow(irisData), size = 120, replace = FALSE)
   irisData$Species <- factor(ifelse(irisData$Species == "setosa", "Setosa", "Other"),
                              levels = c("Setosa", "Other"))
   # Add some fake data so we don't get perfect separation
   irisData$fake1 <- rnorm(nrow(irisData))
   irisData$fake2 <- runif(nrow(irisData))
   irisData$fake3 <- rnorm(nrow(irisData))
   irisData$fake4 <- runif(nrow(irisData))
   training <- irisData[trainIndex, ]
   testing <- irisData[-trainIndex, ]
   ytrain <- training$Species
   training$Species <- NULL
   ytest <- testing$Species
   testing$Species <- NULL
   
   # Perform the tests
   test_that("Testing the supervisedPRIM() and predict.supervisedPRIM() with factors", {
      # Fit the positive and negative thresholds
      expect_error(mp <- supervisedPRIM(x = training, y = ytrain, threshold.type = 1), NA)
      expect_error(mn <- supervisedPRIM(x = training, y = ytrain, threshold.type = -1), NA)
      # Make class predictions
      expect_error(cpp <- predict(mp, newdata = testing), NA)
      expect_error(cpn <- predict(mp, newdata = testing), NA)
      # Verify the integrity of the class predictions
      expect_true(length(cpp) == length(ytest))
      expect_true(length(cpn) == length(ytest))
      expect_true(class(cpp) == "factor")
      expect_true(class(cpn) == "factor")
      expect_true(all(cpp %in% levels(ytrain)))
      expect_true(all(cpn %in% levels(ytrain)))
      
      # Make probability predictions
      expect_error(pp <- predict(mp, newdata = testing, classProb = TRUE), NA)
      expect_error(pn <- predict(mp, newdata = testing, classProb = TRUE), NA)
      # Verify the integrity of the probability predictions
      expect_true(length(pp) == length(ytest))
      expect_true(length(pn) == length(ytest))
      expect_true(class(pp) == "numeric")
      expect_true(class(pn) == "numeric")
      expect_true(min(pp) >= 0)
      expect_true(max(pp) <= 1)
      expect_true(min(pn) >= 0)
      expect_true(max(pn) <= 1)
   })
   
   test_that("Testing the supervisedPRIM() and predict.supervisedPRIM() with binary data", {
     data(quasiflow)
     qf <- quasiflow
     qf$y <- ifelse(quasiflow$y == 1, 1L, 0L)
     qf.label <- qf$y[1:1000]
     qf <- qf[1:1000, 1:3]
     
     expect_error(qf.prim <- supervisedPRIM(x=qf, y=qf.label), NA)
     expect_error(predictions <- predict(qf.prim, newdata = quasiflow[, 1:3]), NA)
     expect_true(all(predictions %in% c(0L, 1L)))
     expect_true(length(predictions) == nrow(quasiflow))
     expect_error(predictions <- predict(qf.prim,
                                         newdata = quasiflow[, 1:3],
                                         classProb = TRUE), NA)
     expect_true(max(predictions) <= 1L)
     expect_true(min(predictions) >= 0L)
     
   })
   
   # Test on a large dataset
   test_that("Testing on a large dataset", {
     data(spam)
     set.seed(99)
     trInd <- sample(1:nrow(spam), size = 4100)
     training <- spam[trInd, ]
     testing <- spam[-trInd, ]
     trainingX <- training
     trainingY <- training$type
     trainingX$type <- NULL
     testingX <- testing
     testingY <- testing$type
     testingX$type <- NULL
     
     # Fit both
     primModPos <- supervisedPRIM(x = trainingX, y = trainingY, threshold.type = 1)
     primModNeg <- supervisedPRIM(x = trainingX, y = trainingY, threshold.type = -1)
     
     # Make the predictions on the test set
     primPosPred <- predict(primModPos, newdata = testingX)
     primNegPred <- predict(primModNeg, newdata = testingX)
     
     expect_true(length(primPosPred) == nrow(testingX))
     expect_true(length(primNegPred) == nrow(testingX))
   })
   
   # Test for invalid input
   test_that("Testing for invalid inputs", {
      mcars <- mtcars
      mcars$am <- factor(mcars$am)
      expect_error(supervisedPRIM(x = mcars[, names(mcars) != "mpg"], y = mcars$mpg))
      expect_error(supervisedPRIM(x = matrix(0, nrow = 10, ncol = 3), y = runif(10)))
   })
}

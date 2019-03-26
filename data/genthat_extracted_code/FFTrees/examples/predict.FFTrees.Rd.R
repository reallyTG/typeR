library(FFTrees)


### Name: predict.FFTrees
### Title: Predict classifications from newdata using an FFTrees object
### Aliases: predict.FFTrees

### ** Examples



  # Create training and test data

  set.seed(100)
  breastcancer <- breastcancer[sample(nrow(breastcancer)),]
  breast.train <- breastcancer[1:150,]
  breast.test <- breastcancer[151:303,]

  # Create an FFTrees x from the training data

  breast.fft <- FFTrees(formula = diagnosis ~.,
                              data = breast.train)

 # Predict classes of test data
  breast.fft.pred <- predict(breast.fft,
                             data = breast.test)

 # Predict class probabilities
  breast.fft.pred <- predict(breast.fft,
                             data = breast.test,
                             type = "prob")





library(DynTxRegime)


### Name: qLearn
### Title: Q-learning
### Aliases: qLearn

### ** Examples

# Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]

# Second-stage regression
  # Create modeling object for main effect component
  moMain <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method='lm')

  # Create modeling object for contrast component
  moCont <- buildModelObj(model = ~ parentBMI + month4BMI,
                          solver.method='lm')

  fitQ2 <- qLearn(moMain = moMain, 
                  moCont = moCont, 
                  data = bmiData,  
                  response = bmiData$y, 
                  txName = "A2", 
                  iter = 0L)

##Available methods

  # Coefficients of the propensity score regression
  coef(fitQ2)

  # Description of method used to obtain object
  DTRstep(fitQ2)

  # Estimated value of the optimal treatment regime for training set
  estimator(fitQ2)

  # Value object returned by propensity score regression method
  fitObject(fitQ2)

  # Estimated optimal treatment for training data
  optTx(fitQ2)

  # Estimated optimal treatment for new data
  optTx(fitQ2, bmiData)

  # Value object returned by outcome regression method
  outcome(fitQ2)

  # Plots if defined by propensity regression method
  dev.new()
  par(mfrow = c(2,4))

  plot(fitQ2)
  plot(fitQ2, suppress = TRUE)

  # Show main results of method
  show(fitQ2)

  # Show summary results of method
  summary(fitQ2)
 

# First-stage regression

  # Create modeling object for main effect component
  moMain <- buildModelObj(model = ~ gender + race + parentBMI + baselineBMI,
                          solver.method='lm')

  # Create modeling object for contrast component
  moCont <- buildModelObj(model = ~ gender + parentBMI,
                          solver.method='lm')

  fitQ1 <- qLearn(moMain = moMain, 
                  moCont = moCont,  
                  response = fitQ2, 
                  data = bmiData,  
                  txName = "A1",  
                  iter = 100L)





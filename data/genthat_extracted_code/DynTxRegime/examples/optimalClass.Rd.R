library(DynTxRegime)


### Name: optimalClass
### Title: Classification Based Estimation of Optimal Dynamic Treatment
###   Regimes
### Aliases: optimalClass

### ** Examples


library(rpart)

# Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]

  # Define the propensity for treatment model and methods.
  moPropen <- buildModelObj(model =  ~ 1, 
                            solver.method = 'glm', 
                            solver.args = list('family'='binomial'),
                            predict.method = 'predict.glm',
                            predict.args = list(type='response'))

  # Define the classification model.
  moClass <- buildModelObj(model = ~parentBMI + month4BMI,
                           solver.method = 'rpart',
                           solver.args = list(method="class"),
                           predict.args = list(type='class'))

# IPWE estimator
  estIPWE <- optimalClass(moPropen = moPropen, moClass = moClass,
                          data = bmiData, response = bmiData$y, txName = "A2",
                          iter = 0L)

  # Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method = 'lm')

  # Create modelObj object for contrast component
  moCont <- buildModelObj(model = ~ parentBMI + month4BMI,
                          solver.method = 'lm')

# AIPWE estimator
  estAIPWE <- optimalClass(moPropen = moPropen, moMain = moMain, 
                           moCont = moCont, moClass = moClass,
                           data = bmiData, response = bmiData$y, txName = "A2",
                           iter = 0L)

## Available methods

  # Value object returned by classification method
  classif(estAIPWE)

  # Coefficients of the propensity score and outcome regression
  coef(estAIPWE)

  # Description of method used to obtain object
  DTRstep(estAIPWE)

  # Estimated value of estimated optimal treatment for training data
  estimator(estAIPWE)

  # Value object returned by outcome regression method
  fitObject(estAIPWE)

  # Estimated optimal treatment for training data
  optTx(estAIPWE)

  # Estimated optimal treatment for new data
  optTx(estAIPWE, newdata = bmiData)

  # Value object returned by outcome regression method
  outcome(estAIPWE)

  # Plots if defined by outcome regression method
  dev.new()
  par(mfrow = c(2,4))
  plot(estAIPWE)

  dev.new()
  par(mfrow = c(2,4))
  plot(estAIPWE, suppress = TRUE)

  # Value object returned by propensity score regression method
  propen(estAIPWE)

  # Show main results of method
  show(estAIPWE)

  # Show summary results of method
  summary(estAIPWE)





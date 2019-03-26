library(DynTxRegime)


### Name: owl
### Title: Outcome Weighted Learning
### Aliases: owl

### ** Examples

# Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]


# Constant propensity model
  moPropen <- buildModelObj(model = ~1,
                            solver.method = 'glm',
                            solver.args = list('family'='binomial'),
                            predict.method = 'predict.glm',
                            predict.args = list(type='response'))

  owlRes <- owl(moPropen = moPropen,
                data = bmiData, reward = bmiData$y,  txName = "A2", 
                regime = ~ parentBMI + month4BMI)

##Available methods

  # Coefficients of the propensity score regression
  coef(owlRes)

  # Description of method used to obtain object
  DTRstep(owlRes)

  # Estimated value of the optimal treatment regime for training set
  estimator(owlRes)

  # Value object returned by propensity score regression method
  fitObject(owlRes)

  # Summary of optimization routine
  optimObj(owlRes)

  # Estimated optimal treatment for training data
  optTx(owlRes)

  # Estimated optimal treatment for new data
  optTx(owlRes, bmiData)

  # Plots if defined by propensity regression method
  dev.new()
  par(mfrow = c(2,4))

  plot(owlRes)
  plot(owlRes, suppress = TRUE)

  # Value object returned by propensity score regression method
  propen(owlRes)

  # Parameter estimates for decision function
  regimeCoef(owlRes)

  # Show main results of method
  show(owlRes)

  # Show summary results of method
  summary(owlRes)
 




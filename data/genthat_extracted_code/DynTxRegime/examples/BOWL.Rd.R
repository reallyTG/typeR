library(DynTxRegime)


### Name: bowl
### Title: Backward Outcome Weighted Learning
### Aliases: bowl

### ** Examples

# Load and process data set
data(bmiData)

# define the negative 12 month change in BMI from baseline
y12 <- -100*(bmiData[,6L] - bmiData[,4L])/bmiData[,4L]

# define the negative 4 month change in BMI from baseline
y4 <- -100*(bmiData[,5L] - bmiData[,4L])/bmiData[,4L]

# reward for second stage
rewardSS <- y12 - y4

#### Second-stage regression

# Constant propensity model
moPropen <- buildModelObj(model = ~1,
                          solver.method = 'glm',
                          solver.args = list('family'='binomial'),
                          predict.method = 'predict.glm',
                          predict.args = list(type='response'))

fitSS <- bowl(moPropen = moPropen,
              data = bmiData, reward = rewardSS,  txName = 'A2', 
              regime = ~ parentBMI + month4BMI)

##Available methods

  # Coefficients of the propensity score regression
  coef(fitSS)

  # Description of method used to obtain object
  DTRstep(fitSS)

  # Estimated value of the optimal treatment regime for training set
  estimator(fitSS)

  # Value object returned by propensity score regression method
  fitObject(fitSS)

  # Summary of optimization routine
  optimObj(fitSS)

  # Estimated optimal treatment for training data
  optTx(fitSS)

  # Estimated optimal treatment for new data
  optTx(fitSS, bmiData)

  # Plots if defined by propensity regression method
  dev.new()
  par(mfrow = c(2,4))

  plot(fitSS)
  plot(fitSS, suppress = TRUE)

  # Value object returned by propensity score regression method
  propen(fitSS)

  # Parameter estimates for decision function
  regimeCoef(fitSS)

  # Show main results of method
  show(fitSS)

  # Show summary results of method
  summary(fitSS)
 
#### First-stage regression

# Constant propensity model
fitFS <- bowl(moPropen = moPropen,
              data = bmiData, reward = y4,  txName = 'A1', 
              regime = ~ gender + parentBMI,
              BOWLObj = fitSS)





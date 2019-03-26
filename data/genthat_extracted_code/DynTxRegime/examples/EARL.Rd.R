library(DynTxRegime)


### Name: earl
### Title: Efficient Augmentation and Relaxation Learning
### Aliases: earl

### ** Examples

# Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]

  bmiData$y <- bmiData$y - min(bmiData$y) + 0.001

# Constant propensity model
  moPropen <- buildModelObj(model = ~1,
                            solver.method = 'glm',
                            solver.args = list('family'='binomial'),
                            predict.method = 'predict.glm',
                            predict.args = list(type='response'))

# IPWE
  earlRes <- earl(moPropen = moPropen, moMain = NULL, moCont = NULL,
                  data = bmiData, response = bmiData$y, txName = "A2", 
                  regime = ~ parentBMI + month4BMI)

#Available methods

# Coefficients of the propensity score regression
coef(earlRes)

# Description of method used to obtain object
DTRstep(earlRes)

# Estimated value of the optimal treatment regime for training set
estimator(earlRes)

# Value object returned by propensity score regression method
fitObject(earlRes)

# Summary of optimization routine
optimObj(earlRes)

# Estimated optimal treatment for training data
optTx(earlRes)

# Estimated optimal treatment for new data
optTx(earlRes, bmiData)

# Plots if defined by propensity regression method
dev.new()
par(mfrow = c(2,4))

plot(earlRes, suppress = FALSE)
plot(earlRes, suppress = TRUE)

# Value object returned by propensity score regression method
propen(earlRes)

# Parameter estimates for decision function
regimeCoef(earlRes)

# Show main results of method
show(earlRes)

# Show summary results of method
summary(earlRes)
 


# Augmented IPWE
  # Create modeling object for main effect component
  moMain <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method='lm')

  # Create modeling object for contrast component
  moCont <- buildModelObj(model = ~ parentBMI + month4BMI,
                          solver.method='lm')

  earlResA <- earl(moPropen = moPropen, moMain = moMain, moCont = moCont,
                   data = bmiData, response = bmiData$y, txName = "A2", 
                   regime = ~ parentBMI + month4BMI)

#Available methods

# Coefficients of the propensity score and outcome regressions
coef(earlResA)

# Description of method used to obtain object
DTRstep(earlResA)

# Estimated value of the optimal treatment regime for training set
estimator(earlResA)

# Value object returned by propensity score and outcome regression methods
fitObject(earlResA)

# Summary of optimization routine
optimObj(earlResA)

# Estimated optimal treatment for training data
optTx(earlResA)

# Estimated optimal treatment for new data
optTx(earlResA, bmiData)

# Value object returned by outcome regression method
outcome(earlResA)

# Plots if defined by propensity score and outcome regressionmethod
dev.new()
par(mfrow = c(2,4))
plot(earlResA, suppress = FALSE)

dev.new()
par(mfrow = c(2,4))
plot(earlResA, suppress = TRUE)

# Value object returned by propensity score regression method
propen(earlResA)

# Parameter estimates for decision function
regimeCoef(earlResA)

# Show main results of method
show(earlResA)

# Show summary results of method
summary(earlResA)
 




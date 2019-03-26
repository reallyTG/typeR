library(DynTxRegime)


### Name: rwl
### Title: Residual Weighted Learning to Estimate Optimal Treatment Regimes
### Aliases: rwl

### ** Examples

# Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData$month12BMI - bmiData$baselineBMI) /
                     bmiData$baselineBMI


# Constant propensity model
  moPropen <- buildModelObj(model = ~1,
                            solver.method = 'glm',
                            solver.args = list('family'='binomial'),
                            predict.method = 'predict.glm',
                            predict.args = list(type='response'))

# Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method = 'lm')
  ## Not run: 
##D     rwlRes <- rwl(moPropen = moPropen, moMain = moMain,
##D                   data = bmiData, reward = bmiData$y, txName = "A2", 
##D                   regime = ~ parentBMI + month4BMI)
##D 
##D ##Available methods
##D 
##D   # Coefficients of the propensity score regression
##D   coef(rwlRes)
##D 
##D   # Description of method used to obtain object
##D   DTRstep(rwlRes)
##D 
##D   # Estimated value of the optimal treatment regime for training set
##D   estimator(rwlRes)
##D 
##D   # Value object returned by propensity score regression method
##D   fitObject(rwlRes)
##D 
##D   # Summary of optimization routine
##D   optimObj(rwlRes)
##D 
##D   # Estimated optimal treatment for training data
##D   optTx(rwlRes)
##D 
##D   # Estimated optimal treatment for new data
##D   optTx(rwlRes, bmiData)
##D 
##D   # Value object returned by outcome regression method
##D   outcome(rwlRes)
##D 
##D   # Plots if defined by propensity regression method
##D   dev.new()
##D   par(mfrow = c(2,4))
##D   plot(rwlRes)
##D 
##D   dev.new()
##D   par(mfrow = c(2,4))
##D   plot(rwlRes, suppress = TRUE)
##D 
##D   # Value object returned by propensity score regression method
##D   propen(rwlRes)
##D 
##D   # Parameter estimates for decision function
##D   regimeCoef(rwlRes)
##D 
##D   # Residuals used on method
##D   residuals(rwlRes)
##D 
##D   # Show main results of method
##D   show(rwlRes)
##D 
##D   # Show summary results of method
##D   summary(rwlRes)
##D  
##D   
## End(Not run)




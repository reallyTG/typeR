library(DynTxRegime)


### Name: iqLearnSS
### Title: IQ-Learning: Second-Stage Regression
### Aliases: iqLearnSS

### ** Examples

# Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]

# Second-stage regression - Single Regression Analysis
  # Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method = 'lm')

  # Create modelObj object for contrast component
  moCont <- buildModelObj(model = ~ parentBMI + month4BMI,
                          solver.method = 'lm')

  iqSS <- iqLearnSS(moMain = moMain, moCont = moCont, 
                    data = bmiData, response = bmiData$y, txName = "A2", 
                    iter = 0L)

## Available methods for second stage step

  # Coefficients of the outcome regression
  coef(iqSS)

  # Description of method used to obtain object
  DTRstep(iqSS)

  # Value object returned by outcome regression method
  fitObject(iqSS)

  # Contrast component of outcome regression
  fittedCont(iqSS)

  # Main effects component of outcome regression
  fittedMain(iqSS)

  # Value object returned by outcome regression method
  outcome(iqSS)

  # Plots if defined by outcome regression method
  dev.new()
  par(mfrow = c(2,4))
  plot(iqSS)
  plot(iqSS, suppress = TRUE)

  # Show main results of method
  show(iqSS)

  # Show summary results of method
  summary(iqSS)





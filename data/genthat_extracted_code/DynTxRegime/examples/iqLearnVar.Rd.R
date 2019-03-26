library(DynTxRegime)


### Name: iqLearnFSV
### Title: IQ-Learning: Variance of the Regression of the Estimated
###   Second-Stage Contrast (IQ3)
### Aliases: iqLearnFSV

### ** Examples

#### Full IQ-Learning Algorithm

## Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]

## Second-stage regression (IQ1)
  # Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method = 'lm')

  # Create modelObj object for contrast component
  moCont <- buildModelObj(model = ~ parentBMI + month4BMI,
                          solver.method = 'lm')

  iqSS <- iqLearnSS(moMain = moMain, moCont = moCont, 
                    data = bmiData, response = bmiData$y, txName = "A2", 
                    iter = 0L)

## Model conditional mean of main effects function (IQ2)
  # Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + race + parentBMI + baselineBMI,
                          solver.method = 'lm')

  # Create modelObj object for contrast component
  moCont <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method = 'lm')

  iqFSM <- iqLearnFSM(moMain = moMain, moCont = moCont, 
                      data = bmiData, response = iqSS, txName = "A1", 
                      iter = 0L)

 
## Model conditional mean of contrast function (IQ3)
  # Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + race + parentBMI + baselineBMI,
                          solver.method = 'lm')

  # Create modelObj object for contrast component
  moCont <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method = 'lm')

  iqFSC <- iqLearnFSC(moMain = moMain, moCont = moCont, 
                      data = bmiData, response = iqSS, txName = "A1", 
                      iter = 0L)

## Estimated optimal treatment and value when variance assumed constant
  # optimal treatment
  ot <- optTx(iqFSM, y = iqFSC, dens = 'nonpar')

  # estimated value
  est <- estimator(x = iqSS, y = iqFSM, z = iqFSC, dens = 'nonpar')

## Log-Linear Variance Modeling (IQ4)

  # heteroskedastic variance
  # Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + race + parentBMI + baselineBMI,
                          solver.method = 'lm')

  # Create modelObj object for contrast component
  moCont <- buildModelObj(model = ~ parentBMI + baselineBMI,
                          solver.method = 'lm')


  iqFSV <- iqLearnFSV(object = iqFSC,
                      moMain = moMain, moCont = moCont, 
                      data = bmiData, txName = "A1", 
                      iter = 0L)

## Estimated optimal treatment and value with log-linear variance modeling
  # optimal treatment
  ot <- optTx(iqFSM, y = iqFSC, z = iqFSV, dens = 'nonpar')

  # estimated value
  est <- estimator(x = iqSS, y = iqFSM, z = iqFSC, w = iqFSV, dens = 'nonpar')

## Available methods for variance step

  # Coefficients of the outcome regression
  coef(iqFSV)

  # Description of method used to obtain object
  DTRstep(iqFSV)

  # Value object returned by outcome regression method
  fitObject(iqFSV)

  # Value object returned by outcome regression method
  outcome(iqFSV)

  # Plots if defined by outcome regression method
  dev.new()
  par(mfrow = c(2,4))
  plot(iqFSV)
  plot(iqFSV, suppress = TRUE)

  # qq-plot
  dev.new()
  qqplot(iqFSV)

  # Show main results of method
  show(iqFSV)

  # Show summary results of method
  summary(iqFSV)





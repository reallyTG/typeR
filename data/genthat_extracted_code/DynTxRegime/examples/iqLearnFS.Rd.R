library(DynTxRegime)


### Name: iqLearnFSM
### Title: IQ-Learning: Regression of Estimated Second-Stage Main Effects
### Aliases: iqLearnFSM

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

## Available methods for main effects step

  # Coefficients of the outcome regression
  coef(iqFSM)

  # Description of method used to obtain object
  DTRstep(iqFSM)

  # Value object returned by outcome regression method
  fitObject(iqFSM)

  # Value object returned by outcome regression method
  outcome(iqFSM)

  # Plots if defined by outcome regression method
  dev.new()
  par(mfrow = c(2,4))
  plot(iqFSM)
  plot(iqFSM, suppress = TRUE)

  # Show main results of method
  show(iqFSM)

  # Show summary results of method
  summary(iqFSM)





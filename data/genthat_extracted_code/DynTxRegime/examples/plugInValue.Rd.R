library(DynTxRegime)


### Name: plugInValue
### Title: Estimate Plug-in Value
### Aliases: plugInValue

### ** Examples

# Load and process data set 
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]

  # generate examples of optimal treatments
  optTx1 <- 2*rbinom(210, 1, 0.4)-1
  optTx2 <- 2*rbinom(210, 1, 0.5)-1

# Plug-in Values
  tx1 <- numeric(nrow(bmiData)) + 1.0
  tx1[bmiData$A1 == "CD"] <- -1.0

  tx2 <- numeric(nrow(bmiData)) + 1.0
  tx2[bmiData$A2 == "CD"] <- -1.0

  plugInValue(optTx1 = optTx1, 
              optTx2 = optTx2, 
              response = bmiData$y,   
              tx1 = tx1,   
              tx2 = tx2)




library(correctedAUC)


### Name: AUCest.Rosner
### Title: Calculate AUC.c for measurement error based on probit-shift
###   model
### Aliases: AUCest.Rosner
### Keywords: method

### ** Examples

  set.seed(1234567)
  tt=genSimDataModelIII(
    nX = 100, 
    nY = 100, 
    mu = 0.25,
    lambda = 0,
    sigma.X2 = 1, 
    sigma.Y2 = 1, 
    sigma.e.X = 1, 
    sigma.e.Y = 1) 

  print(dim(tt$datFrame))
  print(tt$datFrame[1:2,1:3])
  print(tt$AUC.true)

  res = AUCest.Rosner(
    datFrame = tt$datFrame, 
    sidVar = "subjID",
    obsVar = "y",
    grpVar = "grp",
    repVar = "myrep",
    alpha = 0.05)
  print(res)





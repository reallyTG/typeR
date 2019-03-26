library(correctedAUC)


### Name: AUCest.Reiser
### Title: Calculate AUC corrected for measurement error based on Reiser's
###   (2000) method
### Aliases: AUCest.Reiser
### Keywords: method

### ** Examples

  set.seed(1234567)
  tt=genSimDataReiser(
       nX = 100, 
       nY = 100, 
       sigma.X2 = 1, 
       mu.X = 0.25, 
       sigma.Y2 = 1, 
       mu.Y = 0, 
       sigma.epsilon2 = 0.5, 
       sigma.eta2 = 0.5) 

  print(dim(tt$datFrame))
  print(tt$datFrame[1:2,1:3])
  print(tt$theta2)
  print(tt$mu.true)
  print(tt$AUC.true)

  res = AUCest.Reiser(
    datFrame = tt$datFrame, 
    sidVar = "subjID",
    obsVar = "y",
    grpVar = "grp",
    repVar = "myrep",
    alpha = 0.05)
  print(res)





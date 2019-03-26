library(correctedAUC)


### Name: genSimDataModelII
### Title: Generate one simulated data set based on Model II in Rosner et
###   al's (2015) manuscript
### Aliases: genSimDataModelII
### Keywords: method

### ** Examples

  set.seed(1234567)
  tt=genSimDataModelII(
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





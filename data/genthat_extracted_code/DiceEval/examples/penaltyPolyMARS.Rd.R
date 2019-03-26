library(DiceEval)


### Name: penaltyPolyMARS
### Title: Choice of the penalty parameter for a PolyMARS model
### Aliases: penaltyPolyMARS
### Keywords: models

### ** Examples

data(dataIRSN5D)
X	<- dataIRSN5D[,1:5]
Y	<- dataIRSN5D[,6]
data(testIRSN5D)
library(polspline)
Crit	<- penaltyPolyMARS(X,Y,test=testIRSN5D[,-7],graphic=TRUE)




library(anfis)


### Name: ANFIS-class
### Title: ANFIS S4 class implementation in R
### Aliases: ANFIS-class

### ** Examples

##Set 2 cores using global options for parallel library
require("parallel")
if(.Platform$OS.type == "windows"){
 options(mc.cores=1)
}else{
 options(mc.cores=2) ##You could use all calling detectCores()
}

##Example domain for bidimentional sinc(x,y) function
x <- seq(-10, 10, length= 11)
trainingSet <- trainSet(x,x)
Z <- matrix(trainingSet[,"z"],ncol=length(x),nrow=length(x))
persp(x,x,Z,theta = 45, phi = 15, expand = 0.8, col = "lightblue",
 ticktype="detailed",main="sinc(x)*sinc(y)")

##Training domain patterns
X <- trainingSet[,1:2]
Y <- trainingSet[,3,drop=FALSE]

##Defining the required MembershipFunctions for the ANFIS
membershipFunction<-list(
 x=c(new(Class="NormalizedGaussianMF",parameters=c(mu=-10,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=-5,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=0,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=5,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=10,sigma=2))),
 y=c(new(Class="NormalizedGaussianMF",parameters=c(mu=-10,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=-5,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=0,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=5,sigma=2)),
   new(Class="NormalizedGaussianMF",parameters=c(mu=10,sigma=2))))

##Creating the ANFIS network with 2 inputs and 4 MembershipFunctions in
##each input
anfis3 <- new(Class="ANFIS",X,Y,membershipFunction)
anfis3

##Check for epsilon-completeness in each input
plotMFs(anfis3)

##Training the ANFIS network.
## No test: 
trainOutput <- trainHybridJangOffLine(anfis3, epochs=10)
## End(No test)
##We will use instead an already trained object to reduce example time.
data(anfis3)

##How the training went. You can keep on training as the training error
##is still descending.
plot(anfis3)

##Test the fit, i. e., how the MembershipFunctions partition the input space
plotMFs(anfis3)

##Just to see if premises, consequents and errors were updated
getPremises(anfis3)[[input=1]][[mf=1]]
getConsequents(anfis3)[1:2,]
getErrors(anfis3) #Training errors
getTrainingType(anfis3)
names(coef(anfis3))
##An alternative to get premises and/or consequents ...
coef(anfis3)$premises[[input=1]][[mf=1]]
coef(anfis3)$consequents[1:2,]

##First five train pattern associated values for the training process
fitted(anfis3)[1:5,]
resid(anfis3)[1:5,]
summary(anfis3)

##Surface comparison between the original training set and the predicted
##ANFIS network
y <- predict(anfis3,X)
z <- matrix(y[,1],ncol=length(x),nrow=length(x))
par(mfrow=c(1,2))
persp(x,x,Z,theta = 45, phi = 15, expand = 0.8, col = "lightblue",
 ticktype="detailed",main="Goal")
persp(x,x,z,theta = 45, phi = 15, expand = 0.8, col = "lightblue",
 ticktype="detailed",main="Fitted training Patterns", zlim=c(min(Z),max(Z)))




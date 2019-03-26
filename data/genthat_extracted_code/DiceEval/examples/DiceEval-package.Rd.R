library(DiceEval)


### Name: DiceEval-package
### Title: Metamodels
### Aliases: DiceEval-package DiceEval
### Keywords: package models

### ** Examples

## Not run: 
##D rm(list=ls())
##D # A 2D example
##D Branin	<- function(x1,x2) {
##D x1	<- 1/2*(15*x1+5)   
##D x2	<- 15/2*(x2+1)
##D (x2 - 5.1/(4*pi^2)*(x1^2) + 5/pi*x1 - 6)^2 + 10*(1 - 1/(8*pi))*cos(x1) + 10
##D }
##D # A 2D uniform design with n points in [-1,1]^2
##D n	<- 50
##D X	<- matrix(runif(n*2,-1,1),ncol=2,nrow=n)
##D Y	<- Branin(X[,1],X[,2])
##D Z	<- (Y-mean(Y))/sd(Y)
##D 
##D # Construction of a PolyMARS model with a penalty parameter equal to 2
##D library(polspline)
##D modPolyMARS	<- modelFit(X,Z,type = "PolyMARS",gcv=2.2)
##D 
##D # Prediction and comparison between the exact function and the predicted one
##D xtest	<- seq(-1, 1, length= 21) 
##D ytest	<- seq(-1, 1, length= 21)
##D Zreal	<- outer(xtest, ytest, Branin)
##D Zreal	<- (Zreal-mean(Y))/sd(Y)
##D Zpredict	<- modelPredict(modPolyMARS,expand.grid(xtest,ytest))
##D m	<- min(floor(Zreal),floor(Zpredict))
##D M	<- max(ceiling(Zreal),ceiling(Zpredict))
##D persp(xtest, ytest, Zreal, theta = 30, phi = 30, expand = 0.5,
##D 	col = "lightblue",main="Branin function",zlim=c(m,M),
##D 	ticktype = "detailed")
##D 
##D persp(xtest, ytest, matrix(Zpredict,nrow=length(xtest),
##D 	ncol=length(ytest)), theta = 30, phi = 30, expand = 0.5,
##D 	col = "lightblue",main="PolyMARS Model",zlab="Ypredict",zlim=c(m,M),
##D 	ticktype = "detailed")
##D 
##D # Comparison of models
##D modelComparison(X,Y,type=c("Linear", "StepLinear","PolyMARS","Kriging"),
##D 	formula=Y~X1+X2+X1:X2+I(X1^2)+I(X2^2),penalty=log(dim(X)[1]), gcv=4)
##D 
##D # see also the demonstration example in dimension 5 (source: IRSN)
##D demo(IRSN5D)
## End(Not run)




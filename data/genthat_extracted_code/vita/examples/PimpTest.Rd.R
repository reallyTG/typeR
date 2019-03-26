library(vita)


### Name: PimpTest
### Title: PIMP testing approach
### Aliases: PimpTest PimpTest.default print.PimpTest

### ** Examples

## No test: 
###############################
#      Regression            #
##############################

## Simulating data
X = replicate(15,rnorm(100))
X = data.frame(X) #"X" can also be a matrix
y = with(X,2*X1 + 1*X2 + 2*X3 + 1*X4 - 2*X5 - 1*X6 - 1*X7 + 2*X8 )

##############################
## Regression with Random Forest:
library("randomForest")
reg.rf = randomForest(X,y,mtry = 3,ntree=500,importance=TRUE)
##############################
## PIMP-Permutation variable importance measure

system.time(pimp.varImp.reg<-PIMP(X,y,reg.rf,S=100, parallel=TRUE, ncores=2))
pimp.t.reg = PimpTest(pimp.varImp.reg)
summary(pimp.t.reg,pless = 0.1)

##############################
#      Classification        #
##############################

## Simulating data
X = replicate(10,rnorm(200))
X= data.frame( X) #"X" can also be a matrix
z  = with(X,2*X1 + 3*X2 + 2*X3 + 1*X4 -
            2*X5 - 2*X6 - 2*X7 + 1*X8 )
pr = 1/(1+exp(-z))         # pass through an inv-logit function
y = as.factor(rbinom(200,1,pr))

##############################
## Classification with Random Forest:
cl.rf = randomForest(X,y,mtry = 3,ntree = 500, importance = TRUE)
##############################
## PIMP-Permutation variable importance measure
system.time(pimp.varImp.cl<-PIMP(X,y,cl.rf,S=100, parallel=TRUE, ncores=2))
pimp.t.cl = PimpTest(pimp.varImp.cl,para = TRUE)
summary(pimp.t.cl,pless = 0.1)
## End(No test)




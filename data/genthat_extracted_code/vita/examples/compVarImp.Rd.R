library(vita)


### Name: compVarImp
### Title: Compute permutation variable importance measure
### Aliases: compVarImp

### ** Examples

##############################
#      Classification        #
##############################
## Simulating data
X = replicate(8,rnorm(100))
X= data.frame( X) #"X" can also be a matrix
z  = with(X,5*X1 + 3*X2 + 2*X3 + 1*X4 -
            5*X5 - 9*X6 - 2*X7 + 1*X8 )
pr = 1/(1+exp(-z))         # pass through an inv-logit function
y = as.factor(rbinom(100,1,pr))
##############################
## Classification with Random Forest:
library("randomForest")
cl.rf= randomForest(X,y,mtry = 3,ntree=100,
                    importance=TRUE,keep.inbag = TRUE)

##############################
## Permutation variable importance measure
vari= compVarImp(X,y,cl.rf)

##############################
#compare them with the original results
cbind(cl.rf$importance[,1:3],vari$importance)
cbind(cl.rf$importance[,3],vari$importance[,3])
cbind(cl.rf$importanceSD,vari$importanceSD)
cbind(cl.rf$importanceSD[,3],vari$importanceSD[,3])
cbind(cl.rf$type,vari$type)


###############################
#      Regression             #
###############################
## Simulating data
X = replicate(8,rnorm(100))
X= data.frame( X) #"X" can also be a matrix
y= with(X,5*X1 + 3*X2 + 2*X3 + 1*X4 -
          5*X5 - 9*X6 - 2*X7 + 1*X8 )
##############################
## Regression with Random Forest:
library("randomForest")
reg.rf= randomForest(X,y,mtry = 3,ntree=100,
                     importance=TRUE,keep.inbag = TRUE)

##############################
## Permutation variable importance measure
vari= compVarImp(X,y,reg.rf)

##############################
#compare them with the original results
cbind(importance(reg.rf, type=1, scale=FALSE),vari$importance)
cbind(reg.rf$importanceSD,vari$importanceSD)
cbind(reg.rf$type,vari$type)





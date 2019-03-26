library(vita)


### Name: CVPVI
### Title: Cross-validated permutation variable importance measure
### Aliases: CVPVI CVPVI.default print.CVPVI

### ** Examples

##############################
#      Classification        #
##############################
## Simulating data
X = replicate(10,rnorm(100))
X= data.frame( X) #"X" can also be a matrix
z  = with(X,5*X1 + 3*X2 + 2*X3 + 1*X4 -
            5*X5 - 9*X6 - 2*X7 + 1*X8 )
pr = 1/(1+exp(-z))         # pass through an inv-logit function
y = as.factor(rbinom(100,1,pr))
##################################################################
# cross-validated permutation variable importance
cv_vi = CVPVI(X,y,k = 2,mtry = 3,ntree = 1000,ncores = 4)
print(cv_vi)

##################################################################
#compare them with the original permutation variable importance
library("randomForest")
cl.rf = randomForest(X,y,mtry = 3,ntree = 1000, importance = TRUE)

round(cbind(importance(cl.rf, type=1, scale=FALSE),cv_vi$cv_varim),digits=5)


###############################
#      Regression            #
##############################

##################################################################
## Simulating data:
X = replicate(10,rnorm(100))
X = data.frame( X) #"X" can also be a matrix
y = with(X,2*X1 + 2*X2 + 2*X3 + 1*X4 - 2*X5 - 2*X6 - 1*X7 + 2*X8 )

##################################################################
# cross-validated permutation variable importance
cv_vi = CVPVI(X,y,k = 3,mtry = 3,ntree = 1000,ncores = 2)
print(cv_vi)
##################################################################
#compare them with the original permutation variable importance
library("randomForest")
reg.rf = randomForest(X,y,mtry = 3,ntree = 1000, importance = TRUE)

round(cbind(importance(reg.rf, type=1, scale=FALSE),cv_vi$cv_varim),digits=5)





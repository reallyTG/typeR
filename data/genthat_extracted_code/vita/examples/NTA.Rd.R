library(vita)


### Name: NTA
### Title: Novel testing approach
### Aliases: NTA NTA.default print.NTA

### ** Examples

##############################
#      Classification        #
##############################
## Simulating data
X = replicate(100,rnorm(200))
X= data.frame( X) #"X" can also be a matrix
z  = with(X,2*X1 + 3*X2 + 2*X3 + 1*X4 -
            2*X5 - 2*X6 - 2*X7 + 1*X8 )
pr = 1/(1+exp(-z))         # pass through an inv-logit function
y = as.factor(rbinom(200,1,pr))
##################################################################
# cross-validated permutation variable importance

cv_vi = CVPVI(X,y,k = 2,mtry = 3,ntree = 500,ncores = 2)
##################################################################
#compare them with the original permutation variable importance
library("randomForest")
cl.rf = randomForest(X,y,mtry = 3,ntree = 500, importance = TRUE)
##################################################################
# Novel Test approach
cv_p = NTA(cv_vi$cv_varim)
summary(cv_p,pless = 0.1)
pvi_p = NTA(importance(cl.rf, type=1, scale=FALSE))
summary(pvi_p)


###############################
#      Regression             #
###############################
##################################################################
## Simulating data:
X = replicate(100,rnorm(200))
X = data.frame( X) #"X" can also be a matrix
y = with(X,2*X1 + 2*X2 + 2*X3 + 1*X4 - 2*X5 - 2*X6 - 1*X7 + 2*X8 )

##################################################################
# cross-validated permutation variable importance
cv_vi = CVPVI(X,y,k = 2,mtry = 3,ntree = 500,ncores = 2)
##################################################################
#compare them with the original permutation variable importance
reg.rf = randomForest(X,y,mtry = 3,ntree = 500, importance = TRUE)
##################################################################
# Novel Test approach (not tested for regression so far!)
cv_p = NTA(cv_vi$cv_varim)
summary(cv_p,pless = 0.1)
pvi_p = NTA(importance(reg.rf, type=1, scale=FALSE))
summary(pvi_p)




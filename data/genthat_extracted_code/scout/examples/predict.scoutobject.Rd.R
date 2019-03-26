library(scout)


### Name: predict.scoutobject
### Title: Prediction function for covariance-regularized regression, aka
###   the Scout.
### Aliases: predict.scoutobject

### ** Examples

library(lars)
data(diabetes)
attach(diabetes)
# Split data into training and test set
training <- sample(nrow(x2),floor(nrow(x2)/2))
xtrain <- x2[training,]
ytrain <- y[training]
xtest <- x2[-training,]
ytest <- y[-training]
# Done splitting data into training and test set
# Do cross-validation to determine best tuning parameter values for Scout(1,1)
## Not run: cv.out <- cv.scout(xtrain,ytrain,p1=1,p2=1, lam1s=seq(0.001,.15,len=5),K=4)
## Not run: print(cv.out)
# Done cross-validation
## Fit Model
#scout.object <- scout(xtrain,ytrain,p1=1,p2=1,lam1s=cv.out$bestlam1,lam2s=cv.out$bestlam2)
#print(scout.object)
## Done Fitting Model
## Predict on test data, and report MSE
#yhats <- predict(scout.object,xtest)
#print(mean((yhats-ytest)^2))
detach(diabetes)




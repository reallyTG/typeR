library(penalizedSVM)


### Name: findgacv.scad
### Title: Calculate Generalized Approximate Cross Validation Error
###   Estimation for SCAD SVM model
### Aliases: findgacv.scad
### Keywords: models

### ** Examples


# simulate data
train<-sim.data(n = 200, ng = 100, nsg = 10, corr=FALSE, seed=12)
print(str(train)) 
	
# train data	
ff <- scadsvc(as.matrix(t(train$x)), y=train$y, lambda=0.01)
print(str(ff))

# estimate gacv error
(gacv<- findgacv.scad(train$y, model=ff))





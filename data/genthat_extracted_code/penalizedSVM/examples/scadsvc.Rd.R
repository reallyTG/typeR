library(penalizedSVM)


### Name: scadsvc
### Title: Fit SCAD SVM model
### Aliases: scadsvc

### ** Examples



# simulate data
train<-sim.data(n = 200, ng = 100, nsg = 10, corr=FALSE, seed=12)
print(str(train)) 
	
# train data	
model <- scadsvc(as.matrix(t(train$x)), y=train$y, lambda=0.01)
print(str(model))

print(model)





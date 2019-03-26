library(penalizedSVM)


### Name: print
### Title: Print Function for FS SVM
### Aliases: print.penSVM

### ** Examples


seed<- 123
train<-sim.data(n = 20, ng = 100, nsg = 10, corr=FALSE, seed=seed )
print(str(train)) 

# for presentation don't check  all lambdas : time consuming! 
model <- scadsvc(as.matrix(t(train$x)), y=train$y, lambda=0.05)
print(str(model))

print(model)




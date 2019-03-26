library(penalizedSVM)


### Name: predict
### Title: Predict Method for Feature Selection SVM
### Aliases: predict.penSVM

### ** Examples


seed<- 123
train<-sim.data(n = 200, ng = 100, nsg = 10, corr=FALSE, seed=seed )
print(str(train)) 

#train standard svm
my.svm<-svm(x=t(train$x), y=train$y, kernel="linear")

# test with other data
test<- sim.data(n = 200, ng = 100, nsg = 10, seed=(seed+1) )

# Check accuracy standard SVM
my.pred <-ifelse( predict(my.svm, t(test$x)) >0,1,-1)
# Check accuracy:
table(my.pred, test$y)

## Not run: 
##D # define set values of tuning parameter lambda1 for SCAD 
##D lambda1.scad <- c (seq(0.01 ,0.05, .01),  seq(0.1,0.5, 0.2), 1 ) 
##D # for presentation don't check  all lambdas : time consuming! 
##D # computation intensive; for demostration reasons only for the first 100 features
##D # and only for 10 Iterations maxIter=10, default maxIter=700
##D 
##D system.time(fit.scad<- svmfs(x=t(train$x)[,1:100],y=train$y, fs.method="scad", cross.outer= 0,
##D 	grid.search = "discrete",  lambda1.set=lambda1.scad[1:3], show="none",
##D 	parms.coding = "none", maxIter=10,
##D 	inner.val.method = "cv", cross.inner= 5, seed=seed, verbose=FALSE))
##D 
##D 
##D # SCAD 
##D test.error.scad<-predict(fit.scad, newdata=t(test$x)[,1:100],newdata.labels=test$y )
##D  # Check accuracy SCAD SVM  	
##D print(test.error.scad$tab)	
## End(Not run)

#########################################
## analog for 1-norm SVM
#epsi.set<-vector(); for (num in (1:9)) epsi.set<-sort(c(epsi.set, c(num*10^seq(-5, -1, 1 ))) )
#lambda1.1norm <- 	epsi.set[c(3,5)] # 2 params
#
## train 1norm SVM
# norm1.fix<- svmfs(t(train$x), y=train$y, fs.method="1norm", 
#		cross.outer= 0, grid.search = "discrete",  
#		lambda1.set=lambda1.1norm, show="none",
#		parms.coding = "none",
#		maxIter = 700, inner.val.method = "cv", cross.inner= 5,
#		seed=seed, verbose=FALSE ) 	
#	
#	print(norm1.fix)   
#
## L1-norm SVM
#test.error.1norm<-predict(norm1.fix, newdata=t(test$x),newdata.labels=test$y )
# # Check accuracy L1-norm SVM  	
#print(test.error.1norm$tab)	




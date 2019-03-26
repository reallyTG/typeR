library(penalizedSVM)


### Name: svmfs
### Title: Fits SVM mit variable selection using penalties.
### Aliases: svmfs svmfs.default DrHSVM scad_L2.svc
### Keywords: models multivariate optimize

### ** Examples



## No test: 
		
		seed<- 123
		
		train<-sim.data(n = 200, ng = 100, nsg = 10, corr=FALSE, seed=seed )
		print(str(train)) 
		
		
		### Fixed grid ####
		
		# train SCAD SVM ####################
		# define set values of tuning parameter lambda1 for SCAD 
		lambda1.scad <- c (seq(0.01 ,0.05, .01),  seq(0.1,0.5, 0.2), 1 ) 
		# for presentation don't check  all lambdas : time consuming! 
		lambda1.scad<-lambda1.scad[2:3]
		# 
		# train SCAD SVM
		
		# computation intensive; for demostration reasons only for the first 100 features 
		# and only for 10 Iterations maxIter=10, default maxIter=700
		system.time(scad.fix<- svmfs(t(train$x)[,1:100], y=train$y, fs.method="scad", 
  		cross.outer= 0, grid.search = "discrete",  
  		lambda1.set=lambda1.scad,
  		parms.coding = "none", show="none",
  		maxIter = 10, inner.val.method = "cv", cross.inner= 5,
  		seed=seed, verbose=FALSE) 	)
			
		print(scad.fix)
			
		# train 1NORM SVM 	################	
		# define set values of tuning parameter lambda1 for 1norm
		#epsi.set<-vector(); for (num in (1:9)) epsi.set<-sort(c(epsi.set,
		#    c(num*10^seq(-5, -1, 1 ))) )
		## for presentation don't check  all lambdas : time consuming! 
		#lambda1.1norm <- 	epsi.set[c(3,5)] # 2 params
		#
		### train 1norm SVM
		## time consuming: for presentation only for the first 100 features    
		#norm1.fix<- svmfs(t(train$x)[,1:100], y=train$y, fs.method="1norm", 
		#			cross.outer= 0, grid.search = "discrete",  
		#			lambda1.set=lambda1.1norm,
		#			parms.coding = "none", show="none",
		#			maxIter = 700, inner.val.method = "cv", cross.inner= 5,
		#			seed=seed, verbose=FALSE ) 	
		#	
		#	print(norm1.fix)   
		
		### Interval  search  ####
		
		
		seed <- 123
		
		train<-sim.data(n = 200, ng = 100, nsg = 10, corr=FALSE, seed=seed )
		print(str(train)) 
		
		
		test<-sim.data(n = 200, ng = 100, nsg = 10, corr=FALSE, seed=seed+1 )
		print(str(test)) 
		
				
		bounds=t(data.frame(log2lambda1=c(-10, 10)))
						colnames(bounds)<-c("lower", "upper")	
		
		# computation intensive; for demostration reasons only for the first 100 features 
		# and only for 10 Iterations maxIter=10, default maxIter=700
		print("start interval search")
			system.time( scad<- svmfs(t(train$x)[,1:100], y=train$y,
			 fs.method="scad", bounds=bounds, 
			 cross.outer= 0, grid.search = "interval",  maxIter = 10, 
			 inner.val.method = "cv", cross.inner= 5, maxevals=500,
			 seed=seed, parms.coding = "log2", show="none", verbose=FALSE ) )
		print("scad final model")
		print(str(scad$model))
				
		(scad.5cv.test<-predict.penSVM(scad, t(test$x)[,1:100], newdata.labels=test$y)   )
		
		
		print(paste("minimal 5-fold cv error:", scad$model$fit.info$fmin, 
		"by log2(lambda1)=", scad$model$fit.info$xmin))
		
		print(" all lambdas with the same minimum? ")
		print(scad$model$fit.info$ points.fmin) 
		
		print(paste(scad$model$fit.info$neval, "visited points"))
		
		
		print(" overview: over all visitied points in tuning parameter space 
		with corresponding cv errors")
		print(data.frame(Xtrain=scad$model$fit.info$Xtrain, 
					cv.error=scad$model$fit.info$Ytrain))
		# 						 
		
		# create  3 plots on one screen: 
		# 1st plot: distribution of initial points in tuning parameter space
		# 2nd plot: visited lambda points vs. cv errors
		# 3rd plot: the same as the 2nd plot, Ytrain.exclude points are excluded. 
		# The value cv.error = 10^16 stays for the cv error for an empty model ! 
		.plot.EPSGO.parms (scad$model$fit.info$Xtrain, scad$model$fit.info$Ytrain,
				bound=bounds, Ytrain.exclude=10^16, plot.name=NULL )
		
## End(No test) # end of \donttest





library(penalizedSVM)


### Name: EPSGO
### Title: Fits SVM mit variable selection using penalties.
### Aliases: EPSGO Direct ExpImprovement
### Keywords: models multivariate graphs iteration optimize

### ** Examples


	## No test: 
	seed <- 123
			
	train<-sim.data(n = 200, ng = 100, nsg = 10, corr=FALSE, seed=seed )
	print(str(train)) 
			
	Q.func<- ".calc.scad"
	
	bounds=t(data.frame(log2lambda1=c(-10, 10)))
							colnames(bounds)<-c("lower", "upper")	
			
	print("start interval search")
	# computation intensive; 
	# for demostration reasons only for the first 100 features 
	# and only for 10 iterations maxIter=10, default maxIter=700
	system.time(fit<-EPSGO(Q.func, bounds=bounds, parms.coding="log2", fminlower=0, 
		 show='none', N=21,  maxevals=500, 
		 pdf.name=NULL,  seed=seed,  
		 verbose=FALSE,
		 # Q.func specific parameters:
		 x.svm=t(train$x)[,1:100], y.svm=train$y,
		 inner.val.method="cv",
		 cross.inner=5, maxIter=10 ))
									 
	print(paste("minimal 5-fold cv error:", fit$fmin, "by log2(lambda1)=", fit$xmin))
		
	print(" all lambdas with the same minimum? ")
	print(fit$ points.fmin) 
			
	print(paste(fit$neval, "visited points"))
			
			
	print(" overview: over all visitied points in tuning parameter space 
				with corresponding cv errors")
	print(data.frame(Xtrain=fit$Xtrain, cv.error=fit$Ytrain))

	# create  3 plots om one screen: 
	# 1st plot: distribution of initial points in tuning parameter space
	# 2nd plot: visited lambda points vs. cv errors
	# 3rd plot: the same as the 2nd plot, Ytrain.exclude points are excluded. 
	#    The value cv.error = 10^16 stays for the cv error for an empty model ! 
	.plot.EPSGO.parms (fit$Xtrain, fit$Ytrain,bound=bounds, 
				Ytrain.exclude=10^16, plot.name=NULL )
	
## End(No test) # end of \donttest






library(clinDR)


### Name: targetCI
### Title: Compute the dose with confidence interval exceeding a target
###   change from placebo for each simulated example in an emaxsim object.
### Aliases: targetCI
### Keywords: nonlinear

### ** Examples

	## Not run: 
##D 
##D 		# emaxsim changes the random number seed
##D 		nsim<-100
##D 		doselev<-c(0,5,25,50,100)
##D 		n<-c(78,81,81,81,77)
##D 
##D 		### population parameters for simulation
##D 		e0<-2.465375 
##D 		ed50<-67.481113 
##D 		emax<-15.127726
##D 		sdy<-7.967897
##D 		pop<-c(log(ed50),emax,e0)    
##D 		meanlev<-emaxfun(doselev,pop)  
##D 
##D 		###FixedMean is specialized constructor function for emaxsim
##D 		gen.parm<-FixedMean(n,doselev,meanlev,sdy)  
##D 
##D 		D1 <- emaxsim(nsim,gen.parm,modType=3)
##D 
##D 		target<-6
##D 		tD<- ( (target*ed50)/(emax-target) )
##D 		selectedDose<-targetCI(D1,target,dgrid=c(1:100)+0.5,cilev=0.80,high=TRUE)
##D 	
## End(Not run)
	## Don't show: 

		# emaxsim changes the random number seed
		nsim<-3
		doselev<-c(0,5,25,50,100)
		n<-c(78,81,81,81,77)

		### population parameters for simulation
		e0<-2.465375 
		ed50<-67.481113 
		emax<-15.127726
		sdy<-7.967897
		pop<-c(log(ed50),emax,e0)    
		meanlev<-emaxfun(doselev,pop)  

		###FixedMean is specialized constructor function for emaxsim
		gen.parm<-FixedMean(n,doselev,meanlev,sdy)  

		D1 <- emaxsim(nsim,gen.parm,modType=3,nproc=1)

		target<-6
		tD<- ( (target*ed50)/(emax-target) )
		selectedDose<-targetCI(D1,target,dgrid=c(1:100)+0.5,cilev=0.80,high=TRUE)
	
## End(Don't show)




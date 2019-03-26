library(SVMMatch)


### Name: svmmatch
### Title: SVMMatch for Causal Effect Estimation
### Aliases: svmmatch

### ** Examples


##Load data
	data("LaLonde")
	Data1<-LaLonde
	Data1<-Data1[Data1$exper==0|Data1$treat==1,]
	attach(Data1)	

##Format X matrix
	varnames<-c("age","educ","black","married","nodegr","hisp",
		"re75","re74")
	X<-cbind(Data1[,varnames],Data1$re75==0,Data1$re74==0)
	X<-as.matrix(X)

##Fit model
	set.seed(1)
	m1.param<-svmmatch(treat, X, dv=re78, burnin=100, gibbs=100, thin=5)

##Assess balance
	bal1<-balance(treat, X, m1.param)

##Summarize treatment effect
	effect1<-effect(m1.param)

## Not run: 
##D ##Sensitivity analysis (Takes a little longer)
##D 	sens1<-sensitivity(m1.param)
##D 	
## End(Not run)

##Assess ignorability:	
	#Assess control overlap--are there enough
	#controls to balance the treated?
		cont1<-control.overlap(m1.param)	

	#Assess treatment overlap--are there treated 
	#values that can't be matched?
		treat1<-treatment.overlap(m1.param)

##Assess autocorrelation
	ac1<-autocorr(m1.param)





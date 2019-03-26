library(HYRISK)


### Name: SENSI_PINCHING
### Title: Sensitivity analysis using the pinching approach.
### Aliases: SENSI_PINCHING

### ** Examples

## Not run: 
##D #################################################
##D #### EXAMPLE 1 of Dubois & Guyonnet (2011)
##D #### Probability and Possibility distributions
##D #################################################
##D 
##D #### Model function
##D FUN<-function(X){
##D UER=X[1]
##D EF=X[2]
##D I=X[3]
##D C=X[4]
##D ED=X[5]
##D return(UER*I*C*EF*ED/(70*70*365))
##D }
##D 
##D ninput<-5 #Number of input parameters
##D input<-vector(mode="list", length=ninput) # Initialisation
##D 
##D input[[1]]=CREATE_INPUT(
##D 		name="UER",
##D 		type="possi",
##D 		distr="triangle",
##D 		param=c(2.e-2, 5.7e-2, 1.e-1),
##D 		monoton="incr"
##D 		)
##D input[[2]]=CREATE_INPUT(
##D 		name="EF",
##D 		type="possi",
##D 		distr="triangle",
##D 		param=c(200,250,350),
##D 		monoton="incr"
##D 		)
##D input[[3]]=CREATE_INPUT(
##D 		name="I",
##D 		type="possi",
##D 		distr="triangle",
##D 		param=c(1,1.5,2.5),
##D 		monoton="incr"
##D 		)
##D input[[4]]=CREATE_INPUT(
##D 		name="C",
##D 		type="proba",
##D 		distr="triangle",
##D 		param=c(5e-3,20e-3,10e-3)
##D 		)
##D input[[5]]=CREATE_INPUT(
##D 		name="ED",
##D 		type="proba",
##D 		distr="triangle",
##D 		param=c(10,50,30)
##D 		)
##D 
##D ####CREATION OF THE DISTRIBUTIONS ASSOCIATED TO THE PARAMETERS
##D input=CREATE_DISTR(input)
##D 
##D ####VISU INPUT
##D PLOT_INPUT(input)
##D 
##D #################################################
##D #### PROPAGATION
##D 
##D #OPTIMZATION CHOICES
##D choice_opt=NULL #no optimization needed
##D param_opt=NULL
##D 
##D #PROPAGATION RUN
##D Z0_IRS<-PROPAG(N=1000,input,FUN,choice_opt,param_opt,mode="IRS")
##D 
##D #################################################
##D #### PINCHING
##D Z0p<-PINCHING_fun(
##D 	which=1,##first input variable
##D 	value=5.7e-2, ##pinched at the scalar value of 5.7e-2
##D 	N=1000,
##D 	input,
##D 	FUN,
##D 	choice_opt,
##D 	param_opt,
##D 	mode="IRS"
##D 	)
##D 
##D # VISU - PROPAGATION
##D PLOT_CDF(Z0_IRS,xlab="Z",ylab="CDF",main="EX PINCHING",lwd=1.5)
##D PLOT_CDF(Z0p,color1=3,color2=4,new=FALSE,lwd=1.5)
##D 
##D ## quantile mode
##D sensi.quan<-SENSI_PINCHING(Z0_IRS,Z0p,mode="quantile",level=0.75)
##D print(paste("Quantile-based sensitivity measure: ",sensi.quan,sep=""))
##D 
##D ## proba mode
##D sensi.proba<-SENSI_PINCHING(Z0_IRS,Z0p,mode="proba",threshold=2e-6)
##D print(paste("Probability-based sensitivity measure: ",sensi.proba,sep=""))
##D 
##D ## global mode
##D sensi.global<-SENSI_PINCHING(Z0_IRS,Z0p,mode="global",disc=0.01)
##D print(paste("global sensitivity measure: ",sensi.global,sep=""))
##D 
## End(Not run)




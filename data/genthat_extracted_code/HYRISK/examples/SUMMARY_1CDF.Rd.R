library(HYRISK)


### Name: SUMMARY_1CDF
### Title: Function for summarizing the uncertainty propagation's results
###   in the form of a unique CDF.
### Aliases: SUMMARY_1CDF

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
##D #### POST-PROCESSING
##D 
##D # VISU - PROPAGATION
##D PLOT_CDF(Z0_IRS,xlab="Z",ylab="CDF",main="EX 1",lwd=1.5)
##D 
##D # One CDF with risk aversion of 1/3
##D Z<-SUMMARY_1CDF(Z0_IRS,aversion=1/3)
##D lines(ecdf(Z),col=5,lwd=1.5)
##D 
## End(Not run)




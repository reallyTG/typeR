library(HYRISK)


### Name: PROPAG
### Title: Function for conducting joint propagation of uncertainty
### Aliases: PROPAG

### ** Examples

## Not run: 
##D 
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
##D Z0_HYBRID<-PROPAG(N=250,input,FUN,choice_opt,param_opt,mode="HYBRID")
##D 
##D #################################################
##D #### POST-PROCESSING
##D 
##D # VISU - PROPAGATION
##D PLOT_CDF(Z0_IRS,xlab="Z",ylab="CDF",main="EX 1",lwd=1.5)
##D PLOT_CDF(Z0_HYBRID,new=FALSE,color1=3,color2=4,lwd=1.5)
##D 
##D #################################################
##D #### EXAMPLE 2 of Schobi & Sudret (2016)
##D #### Imprecise Probability distributions
##D #################################################
##D 
##D #### Model function
##D FUN<-function(X){
##D A=X[1]
##D B=X[2]
##D return(100*(B-A^2)^2+(1-A)^2)
##D }
##D 
##D ninput<-6 #Number of input parameters
##D input<-vector(mode="list", length=ninput) # Initialisation
##D 
##D # Imprecise normal probability 
##D # whose parameters are described by the 3rd and 5th parameters
##D input[[1]]=CREATE_INPUT(
##D 		name="A",
##D 		type="impr proba",
##D 		distr="normal",
##D 		param=c(3,5),
##D 		monoton="dunno"
##D 		)
##D 
##D # Imprecise normal probability
##D # whose parameters are described by the 4th and 6th parameters
##D input[[2]]=CREATE_INPUT(
##D 		name="B",
##D 		type="impr proba",
##D 		distr="normal",
##D 		param=c(4,6),
##D 		monoton="dunno"
##D 		)
##D 
##D # imprecise paramters of afore-described probability distribution
##D # mean of input number 1 as an interval
##D input[[3]]=CREATE_INPUT(
##D 		name="mu_A",
##D 		type="possi",
##D 		distr="interval",
##D 		param=c(-0.5,0.5)
##D 		)
##D 
##D # mean of input number 2 as an interval
##D input[[4]]=CREATE_INPUT(
##D 		name="mu_B",
##D 		type="possi",
##D 		distr="interval",
##D 		param=c(-0.5,0.5)
##D 		)
##D 
##D # standard deviation of input number 1  as an interval
##D input[[5]]=CREATE_INPUT(
##D 		name="s_A",
##D 		type="possi",
##D 		distr="interval",
##D 		param=c(0.7,1)
##D 		)
##D 
##D # standard deviation of input number 2  as an interval
##D input[[6]]=CREATE_INPUT(
##D 		name="s_B",
##D 		type="possi",
##D 		distr="interval",
##D 		param=c(0.7,1)
##D 		)
##D 
##D 
##D ####CREATION OF THE DISTRIBUTIONS ASSOCIATED TO THE PARAMETERS
##D input=CREATE_DISTR(input)
##D 
##D ####VISU INPUT (needs propagation parameters to plot impr proba distributions)
##D PLOT_INPUT(input)
##D 
##D #################################################
##D ### PROPAGATION
##D # OPTIMZATION CHOICES (could take some time)
##D choice_opt="GENOUD"
##D param_opt=c(50,3,1.e-1)
##D 
##D #PROPAGATION RUN
##D Z0_IRS<-PROPAG(N=1000,input,FUN,choice_opt,param_opt,mode="IRS")
##D 
##D #################################################
##D ### VISU - PROPAGATION
##D PLOT_CDF(Z0_IRS,xlab="Z",ylab="CDF",main="EX 2",lwd=1.5)
##D 
## End(Not run)




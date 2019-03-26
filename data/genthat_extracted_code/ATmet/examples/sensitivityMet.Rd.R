library(ATmet)


### Name: sensitivityMet
### Title: Sensitivity analysis for metrology applications
### Aliases: sensitivityMet
### Keywords: Sobol SRRC metrology

### ** Examples

rm(list=ls())

##Simulate the input sample
M=10000
Xmass <- data.frame(X1 = rnorm(M, 100, 5e-5),
                    X2 = rnorm(M, 0.001234, 2e-5),
                    X3 = runif(M, 1100, 1300),
                    X4 = runif(M,7000000,9000000),
                    X5 = runif(M,7950000,8050000))#Data-frame

#Define the measurement model (GUM-S1, 9.3)
calibMass <-function(x){
  return(((x[,1]+x[,2])*(1+(x[,3]-1200)*(1/x[,4]-1/x[,5]))-100)*1e3)
}

#####   Use SRRC with a model function    #####
#Apply sensitivityMet function to evaluate the associated SRRC indices
S_SRRC=sensitivityMet(model=calibMass,x=Xmass, nboot=100, method="SRRC", conf=0.95)
##Print the results
#First order indices
S_SRRC$S1

#####   Use Sobol with a computational code   #####
#Creation of the design for the computation of Sobol sensitivity indices
S_Sobol=sensitivityMet(model=NULL,x=Xmass,y=NULL, nboot=100, method="Sobol", conf=0.95)

#Obtain the design of experiment to submit to the code
XDesign=S_Sobol$SI$X

#Run the computational code with XDesign as a sample of the input quantities
#We use calibMass function (see GUM-S1) as an example
YDesign=calibMass(XDesign)

#Run the Sobol indices calculations with the outputs of the code
S_Sobol$SI=tell(x=S_Sobol$SI,y=YDesign)

##Print the results
#First order indices
S_Sobol$SI$S
#Total order indices
S_Sobol$SI$T





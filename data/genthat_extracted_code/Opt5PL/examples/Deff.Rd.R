library(Opt5PL)


### Name: Deff
### Title: Obtaining D-efficiency for estimating model parameters
### Aliases: Deff

### ** Examples


##Under the 5PL model with the parameter values
##T5=(30000,0.5,800,0.5,2) and the dose range [1.95,32000],
##find the D-efficiency of the broad range design.

##The broad range design
dose=c(1.95,7.8,31.25,125,500,2000,8000,32000)
dlength=length(dose)
weight=rep(1/dlength,dlength-1)

##Parameter values
T5=c(30000,0.5,800,0.5,2)

##Compute D-efficiency of the broad range design
Deff(weight,dose,model=5,P=T5,LB=1.95,UB=32000,grid=.01)






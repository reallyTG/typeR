library(Opt5PL)


### Name: Dseff
### Title: Obtaining Ds-efficiency for estimating the asymmetric factor
###   under the 5-parameter logistic model.
### Aliases: Dseff

### ** Examples


##Under the 5PL model with the parameter values
##T5=(30000,0.5,800,0.5,2) and the dose range [1.95,32000],
##find the Ds-efficiency of the broad range design.

##The broad range design
dose=c(1.95,7.8,31.25,125,500,2000,8000,32000)
dlength=length(dose)
weight=rep(1/dlength,dlength-1)

##Parameter values for the 5PL model
T5=c(30000,0.5,800,0.5,2)

##Ds efficiency of the broad range design
Dseff(weight,dose,P=T5,LB=1.95,UB=32000,grid=.01)





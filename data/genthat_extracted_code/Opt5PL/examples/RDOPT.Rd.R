library(Opt5PL)


### Name: RDOPT
### Title: Search the robust D-optimal designs for estimating model
###   parameters
### Aliases: RDOPT

### ** Examples


##1. Search the robust D-optimal design for estimating the model parameters
##under the 3,4,5PL models

##Parameter values for the 5PL model
T5=c(30000,0.5,800,0.5,2)
##Parameter values for the 4PL model
T4=c(27264.92,0.67,3340.95,-225.55)
##Parameter values for the 3PL model
T3=c(26715.52,0.70,3204.92)

##Dose range=[1.95,32000]
##Assuming the three models are equally important
RDOPT(LB=1.95,UB=32000,P3=T3,P4=T4,P5=T5,q=c(1/3,1/3,1/3))

##2. Search the D-optimal design for the 3PL model using
##the parameter values T3=(26715.52,0.70,3204.92)
##and the dose range [1.95,32000].

#Set the parameter values for the 3PL model in the form of P5
P5=c(26715.52,0.70,3204.92,0,1)
RDOPT(LB=1.95, UB=32000,P5=P5,q=c(1,0,0))

##3. Search the D-optimal design for the 4PL model using
##the parameter values T4=(27264.92,0.67,3340.95,-225.55)
##and the dose range [1.95,32000].

#Set the parameter values for the 4PL model in the form of P5.
P5=c(27264.92,0.67,3340.95,-225.55,1)
RDOPT(LB=1.95, UB=32000,P5=P5,q=c(0,1,0))





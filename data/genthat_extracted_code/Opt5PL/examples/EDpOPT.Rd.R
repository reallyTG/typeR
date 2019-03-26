library(Opt5PL)


### Name: EDpOPT
### Title: Search c-optimal designs for estimating the EDp under the
###   5-parameter logistic model
### Aliases: EDpOPT

### ** Examples

##Search the c-optimal design for estimating the ED50 under the 5PL model

##Parameter values for the 5PL model
T5=c(30000,0.5,800,0.5,2)

##Dose range=[1.95,32000]

EDpOPT(LB=1.95,UB=32000, P=T5,EDp=.5,grid=.01, r =30,epsilon=.001)





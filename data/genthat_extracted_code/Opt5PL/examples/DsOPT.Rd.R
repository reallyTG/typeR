library(Opt5PL)


### Name: DsOPT
### Title: Search Ds-optimal design for estimating the asymmetric factor
###   under the 5-parameter logistic model.
### Aliases: DsOPT

### ** Examples


##Find the Ds-optimal design for estimating theta_5 under the 5PL model
##with the parameter values T5=(30000,0.5,800,0.5,2) and the dose range [1.95,32000].

##Parameter values for the 5PL model
T5=c(30000,0.5,800,0.5,2)

##Find the Ds-optimal design
DsOPT(LB=1.95, UB=32000, P=T5,grid=.01,epsilon=.001)





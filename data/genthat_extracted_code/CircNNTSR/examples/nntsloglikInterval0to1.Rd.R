library(CircNNTSR)


### Name: nntsloglikInterval0to1
### Title: NNTS log-likelihood function for the incidence data defined in
###   the interval [0,1)
### Aliases: nntsloglikInterval0to1

### ** Examples

data<-c(1,2,6,4,1)
cutpoints<-c(0,0.2,0.4,0.6,0.8,0.9999999)
cpars<-nntsrandominitial(1)
nntsloglikInterval0to1(data, cutpoints, cpars, 1)




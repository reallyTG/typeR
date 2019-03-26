library(GPoM)


### Name: visuEq
### Title: Displays the models Equations
### Aliases: visuEq

### ** Examples

#EQUATIONS VISUALISATION
# number of variables:
nVar <- 3
# maximum polynomial degree:
dMax <- 2
# polynomial organization:
poLabs(nVar,dMax)
# model construction
KL = matrix(0, ncol = 3, nrow = 10)
KL[1,1] <- KL[2,2] <- 1
KL[4,1] <- -1
KL[5,3] <- -0.123456789
# Equations visualisation:
# (a) by default, variables names X1, X2, X3 are used
visuEq(nVar, dMax, KL)
# (b) for susbstit=1, variables names x, y, y are used instead
visuEq(nVar, dMax, KL, approx = TRUE, substit=1)
# (c) the name of the variables can also be chosen manualy
visuEq(nVar, dMax, KL, approx = 3, substit=c('U', 'V', 'W'))

# A canonical model can be provided as a single vector
polyTerms <- c(0.2,0,-1,0.5,0,0,0,0,0,0)
visuEq(3,2,KL)





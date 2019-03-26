library(verification)


### Name: crpsDecompostion
### Title: Decompostion of Continuous Ranked Probability Score
### Aliases: crpsDecomposition crpsFromAlphaBeta
### Keywords: file

### ** Examples

data(precip.ensemble)
x <- precip.ensemble[seq(5,5170,5),]

#Observations are in the column
obs<-x[,3]

#Forecast values of ensemble are in the column 4 to 54
eps<-x[,4:54]

#CRPS calculation 
c<-crpsDecomposition(obs,eps)

#CRPS with alpha and beta
#Resampling indices
nObs<-length(obs)
i<-sample(seq(nObs),nObs,replace=TRUE)
crps2<-crpsFromAlphaBeta(c$alpha[i,],c$beta[i,],c$heaviside0[i],c$heavisideN[i])





library(ssmn)


### Name: ais
### Title: Australian institute of sport data
### Aliases: ais
### Keywords: datasets

### ** Examples


##Load the data
 library(ssmn)
 data(ais)
 attach(ais)

#Set the response y and covariate x
 x1    <- cbind(1,SSF,Ht)
 y     <- Bfat


##Fits a Skew Scale Mixtures of Normal Distributions to the data
fit.ssmn <- ssmn(y, x1, family="sn", method="EM", error =  1e-6, maxit=1000, show.envelope=FALSE)

#Show envelope
theta    <- c(fit.ssmn$beta,fit.ssmn$sigma2,fit.ssmn$lambda)
envel(y,x1,theta,family="sn",alpha=0.05)





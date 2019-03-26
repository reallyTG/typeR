library(FMsmsnReg)


### Name: ais
### Title: Australian institute of sport data
### Aliases: ais
### Keywords: datasets

### ** Examples


##Load the data
 library(FMsmsnReg)
 data(ais)
 attach(ais)
#Set the response y and covariate x
 x1    <- cbind(1,SSF,Ht)
 y     <- Bfat

##Fits a linear Regression Model with Finite Mixtures of Skew t
 parST <- FMsmsnReg(y, x1, g=2, get.init = TRUE, criteria = TRUE,
          group = FALSE,family = "Skew.t", error = 10^-4,
          iter.max = 2000,obs.prob= FALSE, kmeans.param = NULL,show.converge=FALSE,cp=0.5)

##Fits a linear Regression Models with Finite Mixtures of Skew normal
 parSN <- FMsmsnReg(y, x1, g=2, get.init = TRUE, criteria = TRUE,
          group = FALSE,family = "Skew.normal", error = 10^-4,
          iter.max = 5000,obs.prob= FALSE, kmeans.param = NULL,show.converge=FALSE,cp=0.5)

##Fits a linear Regression Models with Finite Mixtures of Skew Contaminated Normal
 parCN <- FMsmsnReg(y, x1, g=2, get.init = TRUE, criteria = TRUE,
          group = FALSE,family = "Skew.cn", error = 10^-4,
          iter.max = 5000,obs.prob= FALSE, kmeans.param = NULL,show.converge=FALSE,cp=0.5)




library(FMsmsnReg)


### Name: horses
### Title: Horse Racing at Eagle Farm data
### Aliases: horses
### Keywords: datasets

### ** Examples

##Load the data
 library(FMsmsnReg)
 data(horses)
 attach(horses)

#Set the response y and covariate x
 x1 <- cbind(1,Last,Carried)
 y  <- Position

##Fits a linear Regression Model with Finite Mixtures of Skew Contaminated Normal

parCN  <- FMsmsnReg(y, x1, g=2, get.init = TRUE, criteria = TRUE, group = FALSE,
         family = "Skew.cn", error = 10^-4, iter.max = 5000,obs.prob= FALSE,
         kmeans.param = NULL,show.converge=FALSE,cp=0.5)

##Fits a linear Regression Model with Finite Mixtures of Skew normal
 parSN <- FMsmsnReg(y, x1, g=2, get.init = TRUE, criteria = TRUE,
          group = FALSE,family = "Skew.normal", error = 10^-4,
          iter.max = 5000,obs.prob= FALSE, kmeans.param = NULL,show.converge=FALSE,cp=0.5)





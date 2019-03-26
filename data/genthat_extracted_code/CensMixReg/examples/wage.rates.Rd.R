library(CensMixReg)


### Name: wage.rates
### Title: Wage Rates of 753 Women
### Aliases: wage.rates
### Keywords: datasets

### ** Examples


#Load the data
 data(wage.rates)

#Set the response y and covariate x
 y    <- wage.rates$wage
 x1   <- cbind(1,wage.rates$age,wage.rates$educ,wage.rates$hours/1000)
 cc   <- c(rep(0,428),rep(1,325))

########################################################################
#Example for regression modelling of censored data based on
#Mixtures of Scale Mixtures of Normal (SMN) distributions
########################################################################
#Obtain the initial values
 initial    <- initial.values.fm.smn.cr(cc, y,x1,g=2,algorithm="k-means"
 ,family="T",lower=1,upper=20,space=1,plotLog = TRUE,searchNU=TRUE,
 printNU=FALSE, saveFigure = FALSE)

##Fits a left mixture censored Student-t model to the data
 fitT <- fm.smn.cr(cc, y, x1, Abetas = initial$Abetas, medj = initial$medj
 , sigma2 = initial$sigma2, pii = initial$pii, nu=initial$nu, g = 2,
 family = "T", error = 0.0001, iter.max = 500)

##Fits a left mixture censored Normal model to the data
 fitN <- fm.smn.cr(cc, y, x1, Abetas = initial$Abetas, medj = initial$medj
 , sigma2 = initial$sigma2, pii = initial$pii, nu=initial$nu, g = 2,
 family = "Normal", error = 0.0001, iter.max = 500)

######################################################################
#Example for finite mixture of regression models for censored data
#based on scale mixtures of modelling of censored data based on
#Mixtures of SMN distributions
######################################################################
#Obtain the initial values
 initial    <- initial.values.fmr.smn.cr(cc, y,x1,g=2,algorithm="k-means"
 ,family="T",lower=1,upper=20,space=1,plotLog = TRUE,searchNU=TRUE,
 printNU=FALSE, saveFigure = FALSE)

##Fits a left mixture censored Student-t model to the data
 fitT <- fmr.smn.cr( cc, y, x1, Abetas = initial$Abetas,
 sigma2 = initial$sigma2, pii = initial$pii, nu=initial$nu,
 g = 2, family = "T", error = 10^-4, iter.max = 500)

##Fits a left mixture censored Normal model to the data
 fitN <- fmr.smn.cr(cc, y, x1, Abetas = initial$Abetas,
 sigma2 = initial$sigma2, pii = initial$pii, nu=initial$nu,
 g = 2, family = "Normal", error = 10^-4, iter.max = 500)





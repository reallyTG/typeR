library(EstCRM)


### Name: fitCRM
### Title: Compute item fit residual statistics for the Continuous Response
###   Model
### Aliases: fitCRM

### ** Examples


##load the dataset EPIA

data(EPIA)

##Due to the run time issues for examples during the package building
##I had to reduce the run time. So, I run the fit analysis for a subset
##of the whole data, the first 100 examinees. You can ignore the
##following line and just run the analysis for the whole dataset.
##Normally, it is not a good idea to run the analysis for a 100
##subjects

EPIA <- EPIA[1:100,]  #Please ignore this line

##Define the vectors "max.item" and "min.item". The maximum possible
##score was 112 and the minimum possible score was 0 for all items

max.item <- c(112,112,112,112,112)
min.item <- c(0,0,0,0,0)

##Estimate item parameters

CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle = 500, converge = 0.01)
par <- CRM$param

##Estimate the person parameters

CRMthetas <- EstCRMperson(EPIA,par,min.item,max.item)

##Compute the item fit residual statistics and empirical item category
##response curves

fit <- fitCRM(EPIA, par, CRMthetas, max.item,group=10)

##Item-fit residual statistics

fit$fit.stat

##Empirical item category response curves
fit$emp.irf[[1]]   #Item 1





library(EstCRM)


### Name: EstCRMperson
### Title: Estimating Person Parameters for the Continuous Response Model
### Aliases: EstCRMperson

### ** Examples


#Load the dataset EPIA

data(EPIA)

##Define the vectors "max.item" and "min.item". The maximum possible
##score was 112 and the minimum possible score was 0 for all items
max.item <- c(112,112,112,112,112)
min.item <- c(0,0,0,0,0)

##Estimate item parameeters
CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle = 500, converge = 0.01)
par <- CRM$param

##Estimate the person parameters

CRMthetas <- EstCRMperson(EPIA,par,min.item,max.item)
theta.par <- CRMthetas$thetas
theta.par

#Load the dataset SelfEff
data(SelfEff)

##Define the vectors "max.item" and "min.item". The maximum possible
##score was 11 and the minimum possible score was 0 for all items

max.item <- c(11,11,11,11,11,11,11,11,11,11)
min.item <- c(0,0,0,0,0,0,0,0,0,0)

##Estimate the item parameters
CRM2 <- EstCRMitem(SelfEff, max.item, min.item, max.EMCycle=200, converge=.01)
par2 <- CRM2$param

##Estimate the person parameters

CRMthetas2 <- EstCRMperson(SelfEff,par2,min.item,max.item)
theta.par2 <- CRMthetas2$thetas
theta.par2





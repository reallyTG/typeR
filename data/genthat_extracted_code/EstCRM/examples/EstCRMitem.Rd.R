library(EstCRM)


### Name: EstCRMitem
### Title: Estimating Item Parameters for the Continuous Response Model
### Aliases: EstCRMitem

### ** Examples


##load the dataset EPIA
data(EPIA)

##Check the class. "data.frame" is required.
class(EPIA)

##Define the vectors "max.item" and "min.item". The maximum possible
##score was 112 and the minimum possible score was 0 for all items

max.item <- c(112,112,112,112,112)
min.item <- c(0,0,0,0,0)

##The maximum number of EM Cycle and the convergence criteria can be
##specified

max.EMCycle=200
converge=.01

##Estimate the item parameters
CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle, converge)
CRM

##Other details

CRM$descriptive
CRM$param
CRM$iterations
CRM$dif

##load the dataset SelfEff

data(SelfEff)

##Check the class. "data.frame" is required.

class(SelfEff)

##Define the vectors "max.item" and "min.item". The maximum possible
##score was 11 and the minimum possible score was 0 for all items

max.item <- c(11,11,11,11,11,11,11,11,11,11)
min.item <- c(0,0,0,0,0,0,0,0,0,0)

##Estimate the item parameters
CRM2 <- EstCRMitem(SelfEff, max.item, min.item, max.EMCycle=200, converge=.01)
CRM2

##Other details

CRM2$descriptive
CRM2$param
CRM2$iterations
CRM2$dif




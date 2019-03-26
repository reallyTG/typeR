library(EstCRM)


### Name: plotCRM
### Title: Draw Three-Dimensional Item Category Response Curves
### Aliases: plotCRM

### ** Examples


##load the dataset EPIA

data(EPIA)

##Define the vectors "max.item" and "min.item". The maximum possible
##score was 112 and the minimum possible score was 0 for all items

min.item <- c(0,0,0,0,0)
max.item <- c(112,112,112,112,112)

##Estimate item parameters

CRM <- EstCRMitem(EPIA, max.item, min.item, max.EMCycle = 500, converge = 0.01)
par <- CRM$param

##Draw theoretical item category response curves for Item 2
plotCRM(par,2,min.item, max.item)





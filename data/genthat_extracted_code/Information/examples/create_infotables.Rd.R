library(Information)


### Name: create_infotables
### Title: Create WOE/NWOE tables and rank variables by IV/NIV
### Aliases: create_infotables

### ** Examples

 
##------------------------------------------------------------
## WOE analysis, no cross validation
##------------------------------------------------------------
library(Information)
data(train, package="Information")
train <- subset(train, TREATMENT==1)
IV <- Information::create_infotables(data=train, y="PURCHASE", parallel=FALSE)
print(head(IV$Summary), row.names=FALSE)
print(IV$Tables$N_OPEN_REV_ACTS, row.names=FALSE)
closeAllConnections()




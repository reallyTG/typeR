library(DataCombine)


### Name: SpreadDummy
### Title: Spread a dummy variable (1's and 0') over a specified time
###   period and for specified groups
### Aliases: SpreadDummy

### ** Examples

# Create dummy data
ID <- sort(rep(seq(1:4), 5))
NotVar <- rep(1:5, 4)
Dummy <-  sample(c(0, 1), size = 20, replace = TRUE)
Data <- data.frame(ID, NotVar, Dummy)

# Spread
DataSpread1 <- SpreadDummy(data = Data, Var = 'Dummy',
                           spreadBy = 2, reminder = FALSE)

DataSpread2 <- SpreadDummy(data = Data, Var = 'Dummy', GroupVar = 'ID',
                           spreadBy = -2)





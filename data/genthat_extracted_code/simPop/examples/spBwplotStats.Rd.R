library(simPop)


### Name: spBwplotStats
### Title: Weighted box plot statistics
### Aliases: spBwplotStats
### Keywords: dplot

### ** Examples


data(eusilcS)

## semi-continuous variable
spBwplotStats(eusilcS$netIncome, 
    weights=eusilcS$rb050, do.out = FALSE)





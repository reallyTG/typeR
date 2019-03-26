library(gmnl)


### Name: getSummary.gmnl
### Title: Get Model Summaries for Use with "mtable"
### Aliases: getSummary.gmnl

### ** Examples

## Estimate MNL models
data("TravelMode", package = "AER")
library(mlogit)
TM <- mlogit.data(TravelMode, choice = "choice", shape = "long", 
                 alt.levels = c("air", "train", "bus", "car"), chid.var = "individual")
                 
mnl.1 <- gmnl(choice ~ wait + vcost + travel + gcost | 0, data = TM)
mnl.2 <- gmnl(choice ~ wait + vcost                  | 0, data = TM) 

## Table
library(memisc)
mtable("MNL 1"= mnl.1, "MNL 2" = mnl.2, 
       summary.stats = c("N", "Log-likelihood", "BIC", "AIC"))




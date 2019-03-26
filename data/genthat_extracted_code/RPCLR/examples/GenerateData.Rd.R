library(RPCLR)


### Name: GenerateData
### Title: Simulate a dataset from a 1:1 matched case control study
### Aliases: GenerateData

### ** Examples

## Simulate Data
MyDat <- GenerateData(50, 3, 7, 0.5, 0.4)
Dat <- MyDat$Data
Out <- MyDat$Out
Strat <- MyDat$Strat




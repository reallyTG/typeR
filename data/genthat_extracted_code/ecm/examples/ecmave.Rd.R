library(ecm)


### Name: ecmave
### Title: Build an averaged error correction model
### Aliases: ecmave

### ** Examples

##Not run

#Use ecm to predict Wilshire 5000 index based on corporate profits, 
#Federal Reserve funds rate, and unemployment rate
data(Wilshire)

#Use 2015-12-01 and earlier data to build models
trn <- Wilshire[Wilshire$date<='2015-12-01',]

#Build five ECM models and average them to get one model
xeq <- xtr <- trn[c('CorpProfits', 'FedFundsRate', 'UnempRate')]
model1 <- ecmave(trn$Wilshire5000, xeq, xtr, includeIntercept=TRUE, k=5)





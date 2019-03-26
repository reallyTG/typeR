library(ecm)


### Name: ecm
### Title: Build an error correction model
### Aliases: ecm

### ** Examples

##Not run

#Use ecm to predict Wilshire 5000 index based on corporate profits, 
#Federal Reserve funds rate, and unemployment rate
data(Wilshire)

#Use 2015-12-01 and earlier data to build models
trn <- Wilshire[Wilshire$date<='2015-12-01',]

#Assume all predictors are needed in the equilibrium and transient terms of ecm
xeq <- xtr <- trn[c('CorpProfits', 'FedFundsRate', 'UnempRate')]
model1 <- ecm(trn$Wilshire5000, xeq, xtr, includeIntercept=TRUE)

#Assume CorpProfits and FedFundsRate are in the equilibrium term, 
#UnempRate has only transient impacts
xeq <- trn[c('CorpProfits', 'FedFundsRate')]
xtr <- trn['UnempRate']
model2 <- ecm(trn$Wilshire5000, xeq, xtr, includeIntercept=TRUE)





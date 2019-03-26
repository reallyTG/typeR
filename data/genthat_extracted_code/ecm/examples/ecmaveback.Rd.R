library(ecm)


### Name: ecmaveback
### Title: Backwards selection using an averaged error correction model
### Aliases: ecmaveback

### ** Examples

##Not run

#Use ecm to predict Wilshire 5000 index based on corporate profits, 
#Federal Reserve funds rate, and unemployment rate
data(Wilshire)

#Use 2015-12-01 and earlier data to build models
trn <- Wilshire[Wilshire$date<='2015-12-01',]

#Use backwards selection to choose which predictors are needed 
xeq <- xtr <- trn[c('CorpProfits', 'FedFundsRate', 'UnempRate')]
modelaveback <- ecmaveback(trn$Wilshire5000, xeq, xtr, k = 5)
print(modelaveback)
#Backwards selection chose CorpProfits and FedFundsRate in the equilibrium term, 
#CorpProfits and UnempRate in the transient term.

modelavebackFFR <- ecmaveback(trn$Wilshire5000, xeq, xtr, k = 5, keep = 'UnempRate')
print(modelavebackFFR)
#Backwards selection was forced to retain UnempRate in both terms.





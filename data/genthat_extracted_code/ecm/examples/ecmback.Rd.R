library(ecm)


### Name: ecmback
### Title: Backwards selection to build an error correction model
### Aliases: ecmback

### ** Examples

##Not run

#Use ecm to predict Wilshire 5000 index based on corporate profits, 
#Federal Reserve funds rate, and unemployment rate
data(Wilshire)

#Use 2015-12-01 and earlier data to build models
trn <- Wilshire[Wilshire$date<='2015-12-01',]

#Use backwards selection to choose which predictors are needed 
xeq <- xtr <- trn[c('CorpProfits', 'FedFundsRate', 'UnempRate')]
modelback <- ecmback(trn$Wilshire5000, xeq, xtr)
print(modelback)
#Backwards selection chose CorpProfits and FedFundsRate in the equilibrium term, 
#CorpProfits and UnempRate in the transient term.

modelbackFFR <- ecmback(trn$Wilshire5000, xeq, xtr, keep = 'UnempRate')
print(modelbackFFR)
#Backwards selection was forced to retain UnempRate in both terms.





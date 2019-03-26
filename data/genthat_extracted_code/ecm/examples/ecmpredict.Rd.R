library(ecm)


### Name: ecmpredict
### Title: Predict using an ecm object
### Aliases: ecmpredict

### ** Examples

##Not run

data(Wilshire)

#Rebuilding model1 from ecm example
trn <- Wilshire[Wilshire$date<='2014-12-01',]
xeq <- xtr <- trn[c('CorpProfits', 'FedFundsRate', 'UnempRate')]
model1 <- ecm(trn$Wilshire5000, xeq, xtr)

#Use 2014-12-01 and onwards data as test data to predict
tst <- Wilshire[Wilshire$date>='2014-12-01',]

#predict on tst using model1 and initial FedFundsRate
tst$model1Pred <- ecmpredict(model1, tst, tst$Wilshire5000[1])





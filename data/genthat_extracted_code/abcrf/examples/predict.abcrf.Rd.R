library(abcrf)


### Name: predict.abcrf
### Title: Predict and evaluate the posterior probability of the MAP for
###   new data using an ABC-RF object
### Aliases: predict.abcrf

### ** Examples

data(snp)
modindex <- snp$modindex[1:500]
sumsta <- snp$sumsta[1:500,]
data1 <- data.frame(modindex, sumsta)
model.rf <- abcrf(modindex~., data1, ntree=100)
data(snp.obs)
predict(model.rf, snp.obs, data1, ntree=100)




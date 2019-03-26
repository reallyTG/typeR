library(abcrf)


### Name: predict.regAbcrf
### Title: Predict posterior expectation, median, variance and quantiles
###   given a new dataset using a reg-ABC-RF object
### Aliases: predict.regAbcrf

### ** Examples

data(snp)
modindex <- snp$modindex
sumsta <- snp$sumsta[modindex == "3",]
r <- snp$param$r[modindex == "3"]
r <- r[1:500]
sumsta <- sumsta[1:500,]
data2 <- data.frame(r, sumsta)
model.rf.r <- regAbcrf(r~., data2, ntree=100)
data(snp.obs)
predict(model.rf.r, snp.obs, data2)




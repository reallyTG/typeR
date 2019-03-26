library(abcrf)


### Name: regAbcrf
### Title: Create a reg-ABC-RF object: a regression random forest from a
###   reference table aimed out predicting posterior expectation, variance
###   and quantiles for a parameter
### Aliases: regAbcrf regAbcrf.formula

### ** Examples

data(snp)
modindex <- snp$modindex
sumsta <- snp$sumsta[modindex == "3",]
r <- snp$param$r[modindex == "3"]
r <- r[1:500]
sumsta <- sumsta[1:500,]
data2 <- data.frame(r, sumsta)
model.rf.r <- regAbcrf(r~., data2, ntree=100)
model.rf.r




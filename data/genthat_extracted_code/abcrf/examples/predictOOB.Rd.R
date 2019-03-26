library(abcrf)


### Name: predictOOB
### Title: Predict out-of-bag posterior expectation, median, variance,
###   quantiles and error measures using a reg-ABC-RF object
### Aliases: predictOOB predictOOB.regAbcrf

### ** Examples

data(snp)
modindex <- snp$modindex
sumsta <- snp$sumsta[modindex == "3",]
r <- snp$param$r[modindex == "3"]
r <- r[1:500]
sumsta <- sumsta[1:500,]
data2 <- data.frame(r, sumsta)
model.rf.r <- regAbcrf(r~., data2, ntree=100)
res <- predictOOB(model.rf.r, data2) 




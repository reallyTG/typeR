library(abcrf)


### Name: covRegAbcrf
### Title: Predict posterior covariance between two parameters for new data
###   using two reg-ABC-RF objects
### Aliases: covRegAbcrf covRegAbcrf.regAbcrf

### ** Examples

data(snp)
modindex <- snp$modindex
sumsta <- snp$sumsta[modindex == "3",]
r <- snp$param$r[modindex == "3"]
r <- r[1:500]
sumsta <- sumsta[1:500,]
data2 <- data.frame(r, sumsta)
model.rf.r <- regAbcrf(r~., data2, ntree=100)
N1 <- snp$param$N1[modindex == "3"]
N1 <- N1[1:500]
data3 <- data.frame(N1, sumsta) 
model.rf.N1 <- regAbcrf(N1~., data3, ntree=100)
data(snp.obs)
covRegAbcrf(model.rf.r, model.rf.N1, snp.obs, 
            data2, data3, ntree=100)




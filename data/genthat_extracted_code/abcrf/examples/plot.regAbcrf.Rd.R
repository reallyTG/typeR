library(abcrf)


### Name: plot.regAbcrf
### Title: Plot of a reg-ABC-RF object
### Aliases: plot.regAbcrf

### ** Examples

data(snp)
modindex <- snp$modindex
sumsta <- snp$sumsta[modindex == "3",]
r <- snp$param$r[modindex == "3"]
r <- r[1:500]
sumsta <- sumsta[1:500,]
data2 <- data.frame(r, sumsta)
model.rf.r <- regAbcrf(r~., data2, ntree=100)
plot(model.rf.r)




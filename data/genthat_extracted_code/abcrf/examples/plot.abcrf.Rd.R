library(abcrf)


### Name: plot.abcrf
### Title: Plot of an ABC-RF object
### Aliases: plot.abcrf

### ** Examples

data(snp)
modindex <- snp$modindex[1:500]
sumsta <- snp$sumsta[1:500,]
data1 <- data.frame(modindex, sumsta)
model.rf <- abcrf(modindex~., data1, ntree=100)
plot(model.rf, data1)
data(snp.obs)
plot(model.rf, data1, obs=snp.obs[1,])




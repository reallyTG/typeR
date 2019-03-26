library(abcrf)


### Name: err.abcrf
### Title: Calculate and plot for different numbers of tree, the out-of-bag
###   errors associated with an ABC-RF object
### Aliases: err.abcrf

### ** Examples

data(snp)
modindex <- snp$modindex[1:500]
sumsta <- snp$sumsta[1:500,]
data1 <- data.frame(modindex, sumsta)
model.rf <- abcrf(modindex~., data1, ntree=100)
err.rf <- err.abcrf(model.rf, data1)




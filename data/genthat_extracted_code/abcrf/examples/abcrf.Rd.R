library(abcrf)


### Name: abcrf
### Title: Create an ABC-RF object: a classification random forest from a
###   reference table towards performing an ABC model choice
### Aliases: abcrf abcrf.formula

### ** Examples

data(snp)
modindex <- snp$modindex[1:500]
sumsta <- snp$sumsta[1:500,]
data1 <- data.frame(modindex, sumsta)
model.rf1 <- abcrf(modindex~., data = data1, ntree=100)
model.rf1
model.rf2 <- abcrf(modindex~., data = data1, group = list(c("1","2"),"3"), ntree=100)
model.rf2




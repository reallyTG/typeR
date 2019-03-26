library(abcrf)


### Name: err.regAbcrf
### Title: Calculate and plot for different numbers of tree, the out-of-bag
###   mean squared errors associated with a REG-ABC-RF object
### Aliases: err.regAbcrf

### ** Examples

  data(snp)
  modindex <- snp$modindex
  sumsta <- snp$sumsta[modindex == "3",]
  r <- snp$param$r[modindex == "3"]
  r <- r[1:500]
  sumsta <- sumsta[1:500,]
  data2 <- data.frame(r, sumsta)
  model.rf.r <- regAbcrf(r~., data2, ntree=100)
  err.regAbcrf(model.rf.r, data2)




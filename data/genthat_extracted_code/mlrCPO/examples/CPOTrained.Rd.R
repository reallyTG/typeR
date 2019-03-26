library(mlrCPO)


### Name: CPOTrained
### Title: Get the Retransformation or Inversion Function from a Resulting
###   Object
### Aliases: CPOTrained CPORetrafo CPOInverter retrafo inverter retrafo<-
###   inverter<-

### ** Examples

traindat = subsetTask(pid.task, 1:400)
preddat = subsetTask(pid.task, 401:768)

trained = traindat %>>% cpoPca()
reFun = retrafo(trained)
predicted = preddat %>>% reFun
head(getTaskData(predicted))

# chaining works
trained = traindat %>>% cpoPca() %>>% cpoScale()
reFun = retrafo(trained)
predicted = preddat %>>% reFun
head(getTaskData(predicted))

# reset the retrafo when doing other steps!

trained.tmp = traindat %>>% cpoPca()
reFun1 = retrafo(trained.tmp)

imp = impute(trained.tmp)
trained.tmp = imp$task  # nonsensical example
retrafo(trained.tmp) = NULL  # NECESSARY HERE

trained = trained.tmp %>>% cpoScale()

reFun2 = retrafo(trained)
predicted = getTaskData(reimpute(preddat %>>% reFun1, imp$desc),
  target.extra = TRUE)$data %>>% reFun2




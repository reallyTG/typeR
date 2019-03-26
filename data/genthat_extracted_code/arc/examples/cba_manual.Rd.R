library(arc)


### Name: cba_manual
### Title: CBA Classifier from provided rules
### Aliases: cba_manual

### ** Examples

  data(humtemp)
  data_raw<-humtemp
  data_discr <- humtemp

  #custom discretization
  data_discr[,1]<-cut(humtemp[,1],breaks=seq(from=15,to=45,by=5))
  data_discr[,2]<-cut(humtemp[,2],breaks=c(0,40,60,80,100))

  #change interval syntax from (15,20] to (15;20], which is required by MARC
  data_discr[,1]<-as.factor(unlist(lapply(data_discr[,1], function(x) {gsub(",", ";", x)})))
  data_discr[,2]<-as.factor(unlist(lapply(data_discr[,2], function(x) {gsub(",", ";", x)})))
  data_discr[,3] <- as.factor(humtemp[,3])

  #mine rules
  classAtt="Class"
  appearance <- getAppearance(data_discr, classAtt)
  txns_discr <- as(data_discr, "transactions")
  rules <- apriori(txns_discr, parameter =
   list(confidence = 0.5, support= 3/nrow(data_discr), minlen=1, maxlen=5), appearance=appearance)
  inspect(rules)


  rmCBA <- cba_manual(data_raw,  rules, txns_discr, appearance$rhs,
   classAtt, cutp= list(), pruning_options=NULL)
  inspect (rmCBA@rules)
  # prediction <- predict(rmCBA,data_discr,discretize=FALSE)
  # acc <- CBARuleModelAccuracy(prediction, data_discr[[classAtt]])
  # print(paste("Accuracy:",acc))




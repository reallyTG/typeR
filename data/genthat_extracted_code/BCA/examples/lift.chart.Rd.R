library(BCA)


### Name: lift.chart
### Title: Lift Charts to Compare Binary Predictive Models
### Aliases: lift.chart
### Keywords: misc

### ** Examples

  library(rpart)
  layout(matrix(c(1,2), 2, 1))
  data(CCS)
  CCS$Sample <- create.samples(CCS, est=0.4, val=0.4)
  CCSEst <- CCS[CCS$Sample == "Estimation",]
  CCS.glm <- glm(MonthGive ~ DonPerYear + LastDonAmt + Region + YearsGive,
    family=binomial(logit), data=CCSEst)
  library(rpart)
  CCS.rpart <- rpart(MonthGive ~ DonPerYear + LastDonAmt + Region + YearsGive,
    data=CCSEst, cp=0.0074)
  CCSVal <- CCS[CCS$Sample == "Validation",]
  lift.chart(c("CCS.glm", "CCS.rpart"), data=CCSVal, targLevel="Yes",
    trueResp=0.01, type="cumulative", sub="Validation")
  lift.chart(c("CCS.glm", "CCS.rpart"), data=CCSVal, targLevel="Yes",
    trueResp=0.01, type="incremental", sub="Validation")
  



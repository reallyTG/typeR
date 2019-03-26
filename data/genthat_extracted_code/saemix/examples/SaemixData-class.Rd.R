library(saemix)


### Name: SaemixData-class
### Title: Class "SaemixData"
### Aliases: SaemixData-class SaemixData SaemixRepData-class
###   SaemixSimData-class
### Keywords: classes

### ** Examples

showClass("SaemixData")

# Specifying column names
data(theo.saemix)
saemix.data<-saemixData(name.data=theo.saemix,header=TRUE,sep=" ",na=NA, 
  name.group=c("Id"),name.predictors=c("Dose","Time"),
  name.response=c("Concentration"),name.covariates=c("Weight","Sex"),
  units=list(x="hr",y="mg/L",covariates=c("kg","-")), name.X="Time")

# Specifying column numbers
data(theo.saemix)
saemix.data<-saemixData(name.data=theo.saemix,header=TRUE,sep=" ",na=NA,
  name.group=1,name.predictors=c(2,3),name.response=c(4), name.covariates=5:6, 
  units=list(x="hr",y="mg/L",covariates=c("kg","-")), name.X="Time")

# No column names specified, using automatic recognition of column names
data(PD1.saemix)
saemix.data<-saemixData(name.data=PD1.saemix,header=TRUE, 
  name.covariates=c("gender"),units=list(x="mg",y="-",covariates=c("-")))





library(saemix)


### Name: saemixData
### Title: Function to create a SaemixData object
### Aliases: saemixData

### ** Examples


data(theo.saemix)

saemix.data<-saemixData(name.data=theo.saemix,header=TRUE,sep=" ",na=NA, 
  name.group=c("Id"),name.predictors=c("Dose","Time"),
  name.response=c("Concentration"),name.covariates=c("Weight","Sex"),
  units=list(x="hr",y="mg/L",covariates=c("kg","-")), name.X="Time")

print(saemix.data)

plot(saemix.data)




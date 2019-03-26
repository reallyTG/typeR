library(surrosurvROC)


### Name: surrosurvROC
### Title: Surrogate Survival ROC
### Aliases: surrosurvROC
### Keywords: biomarkers, inverse probability weighing, bootstrap

### ** Examples

DATA=data.frame(
  Time=   c(1,2,5,3,9,NA,8,9,10,NA,NA,NA,6,4,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),
  Status= c(1,1,0,0,1,NA,1,1,0, NA,NA,NA,0,0,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),
  STime=  c(3,2,4,2,8,5,8,7,11,1,8,9,3,5,2,5,10,3,5,8,5,2,4,6,7),
  SStatus=c(1,0,1,0,1,1,1,0,0,1,1,1,1,0,1,1,0,0,1,0,1,0,1,0,0),
  Marker= c(1,5,1,2,3,1,2,3,4,5,9,8,5,7,3,4,2,5,3,4,7,5,9,3,8)
)

#COX at year 3
RES1=surrosurvROC(DATA, method="COX", pred.time=3)
print(RES1)

#KNN at year 3
nobs=sum(!is.na(DATA$Time))
span=0.25*nobs^(-0.20)
RES2=surrosurvROC(DATA, method="KNN",pred.time=3,span=span)
print(RES2)




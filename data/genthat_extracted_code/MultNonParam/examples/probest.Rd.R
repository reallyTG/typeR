library(MultNonParam)


### Name: probest
### Title: Stratified Multivariate Kawaguchi Koch Wang Estimators
### Aliases: probest

### ** Examples

# Breast cancer data from the MultNonParam package.
data(sotiriou)
attach(sotiriou)
#First simple plot of the data
plot(AGE,TUMOR_SIZE,pch=(recur+1),main="Age and Tumor Size",
  sub="Breast Cancer Recurrence Data",xlab="Age (years)",
  ylab="Tumor Size",col=c("blue","darkolivegreen"))
legend(31,8,legend=c("Not Recurrent","Recurrent"),
  pch=1:2,col=c("blue","darkolivegreen"))
#AGE and TUMOR_SIZE are the response variables, recur is used for the groups,
#TAMOXIFEN_TREATMENT for the stratum and ELSTON.ELLIS_GRADE is a covariate.
po<-probest(sotiriou,c("AGE","TUMOR_SIZE"),"recur",
  "TAMOXIFEN_TREATMENT","ELSTON.ELLIS_GRADE")




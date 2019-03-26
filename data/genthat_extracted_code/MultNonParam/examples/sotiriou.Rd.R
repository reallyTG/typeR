library(MultNonParam)


### Name: sotiriou
### Title: Breast cancer data set
### Aliases: sotiriou

### ** Examples

data(sotiriou)
attach(sotiriou)
plot(AGE,TUMOR_SIZE,pch=(recur+1),
   main="Age and Tumor Size",
   sub="Breast Cancer Recurrence Data",
   xlab="Age (years)",ylab="Tumor Size",
   col=c("blue","darkolivegreen"))
legend(31,8,legend=c("Not Recurrent","Recurrent"),pch=1:2,
   col=c("blue","darkolivegreen"))





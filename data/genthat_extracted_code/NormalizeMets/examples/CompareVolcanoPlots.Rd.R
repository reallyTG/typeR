library(NormalizeMets)


### Name: CompareVolcanoPlots
### Title: Compare Volcano plots
### Aliases: CompareVolcanoPlots

### ** Examples

data("alldata_eg")
featuredata_eg<-alldata_eg$featuredata
dataview(featuredata_eg)
sampledata_eg<-alldata_eg$sampledata
dataview(sampledata_eg)
metabolitedata_eg<-alldata_eg$metabolitedata
dataview(metabolitedata_eg)

logdata <- LogTransform(featuredata_eg)
dataview(logdata$featuredata)
imp <-  MissingValues(logdata$featuredata,sampledata_eg,metabolitedata_eg,
                     feature.cutof=0.8, sample.cutoff=0.8, method="knn")
dataview(imp$featuredata)

#Linear model fit using unadjusted data
factormat<-model.matrix(~gender +Age +bmi, sampledata_eg)
unadjustedFit<-LinearModelFit(featuredata=imp$featuredata,
                             factormat=factormat,
                             ruv2=FALSE)
unadjustedFit

#Linear model fit using `is' normalized data 
Norm_is <-NormQcmets(imp$featuredata, method = "is", 
                    isvec = imp$featuredata[,which(metabolitedata_eg$IS ==1)[1]])
isFit<-LinearModelFit(featuredata=Norm_is$featuredata,
                     factormat=factormat,
                     ruv2=FALSE)
isFit

#Linear model fit with ruv-2 normalization
ruv2Fit<-LinearModelFit(featuredata=imp$featuredata,
                       factormat=factormat,
                       ruv2=TRUE,k=2,
                       qcmets = which(metabolitedata_eg$IS ==1))
ruv2Fit

#Exploring metabolites associated with age
lcoef_age<-list(unadjusted=unadjustedFit$coefficients[,"Age"],
               is_age=isFit$coefficients[,"Age"],
               ruv2_age=ruv2Fit$coefficients[,"Age"])
lpvals_age<-list(unadjusted=unadjustedFit$p.value[,"Age"],
                is=isFit$p.value[,"Age"],
                ruv2=ruv2Fit$p.value[,"Age"])

negcontrols<-metabolitedata_eg$names[which(metabolitedata_eg$IS==1)]                   

CompareVolcanoPlots(lcoef=lcoef_age, 
                   lpvals_age, 
                   xlab="Coef",
                   negcontrol=negcontrols)





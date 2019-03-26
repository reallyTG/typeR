library(NormalizeMets)


### Name: VolcanoPlot
### Title: Volcano plot
### Aliases: VolcanoPlot

### ** Examples

 data("alldata_eg")
logdata<-LogTransform(alldata_eg$featuredata)
sampledata<-alldata_eg$sampledata
metabolitedata<-alldata_eg$metabolitedata
imp <-  MissingValues(logdata$featuredata,sampledata,metabolitedata,
                     feature.cutof=0.8, sample.cutoff=0.8, method="knn")
featuredata<-imp$featuredata
qcmets<-which(metabolitedata[,1]=="IS")
factormat<-model.matrix(~gender +Age , sampledata)

#Linear model fit with ordinary statistics with ruv2
ordFit_ruv2<-LinearModelFit(featuredata=featuredata,
                           factormat=factormat,
                           ruv2=TRUE, qcmets=qcmets,
                           k=2)
#Volcano plot
VolcanoPlot(coef=ordFit_ruv2$coefficients[,3], 
           pval=ordFit_ruv2$p.value[,3],
           cexlab = 0.8, 
           interactiveplot = TRUE, 
           coeflimit = 0.05,
           xlab="Coef",
           negcontrol= rownames(ordFit_ruv2$coefficients)
           [which(metabolitedata[,2]==1)],
           poscontrol= c("m74", "m161"),
           interactiveonly = TRUE)




library(NormalizeMets)


### Name: MissingValues
### Title: Missing value replacement
### Aliases: MissingValues

### ** Examples


    data(alldata_eg)
    featuredata_eg<-alldata_eg$featuredata
    sampledata_eg<-alldata_eg$sampledata
    metabolitedata_eg<-alldata_eg$metabolitedata
    logdata <- LogTransform(featuredata_eg)
    
    imp <-  MissingValues(logdata$featuredata,sampledata_eg,metabolitedata_eg,
                      feature.cutof=0.8, sample.cutoff=0.8, method="knn")
    imp
    dataview(imp$featuredata)                       





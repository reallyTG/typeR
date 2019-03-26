library(NormalizeMets)


### Name: NormScaling
### Title: Normalisation methods based on scaling
### Aliases: NormScaling

### ** Examples


   ## Reading the data
     data(mixdata)
     featuredata <- mixdata$featuredata
     sampledata<-mixdata$sampledata
     metabolitedata<-mixdata$metabolitedata
     refvec<-featuredata[,which(metabolitedata$type =="IS")[1]]
    
    ## Normalise by the median
    norm_med <- NormScaling(featuredata, method = "median")
    
    ## Normalise by a reference vector, in this case an internal standard
    norm_is <- NormScaling(featuredata, method = "ref", 
        refvec=refvec)

    ## Normalise by the sum
    norm_sum <- NormScaling(featuredata, method = "sum")

   ## Rla Plots after normalising by the median
    RlaPlots(norm_med$featuredata, group= sampledata$batch)





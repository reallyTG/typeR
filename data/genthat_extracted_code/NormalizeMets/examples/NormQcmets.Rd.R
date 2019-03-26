library(NormalizeMets)


### Name: NormQcmets
### Title: Normalisation methods based on quality control metabolites
### Aliases: NormQcmets

### ** Examples


   ## Reading the data
     data(mixdata)
     featuredata <- mixdata$featuredata
     sampledata<-mixdata$sampledata
     metabolitedata<-mixdata$metabolitedata
     isvec<-featuredata[,which(metabolitedata$type =="IS")[1]]
     factors<-sampledata$type
     qcmets<-which(metabolitedata$type =="IS")
    
    ## Normalise by an internal or an internal standard
    norm_is <- NormQcmets(featuredata, method = "is", isvec=isvec)
    PcaPlots(norm_is$featuredata, factors)
    
    ## Normalise by the NOMIS method
    norm_nomis <- NormQcmets(featuredata, method = "nomis", qcmets = qcmets)
    PcaPlots(norm_nomis$featuredata, factors)
    
    ## Normalise by the CCMN method
    norm_ccmn <- NormQcmets(featuredata, factors, method = "ccmn", qcmets = qcmets, ncomp = 2)
    PcaPlots(norm_ccmn$featuredata, factors)
    
    ## Normalise using RUV-random method
    norm_ruvrand <- NormQcmets(featuredata, method = "ruvrand", qcmets = qcmets, k = 2)
    PcaPlots(norm_ruvrand$featuredata, factors)
    PcaPlots(norm_ruvrand$uvdata, sampledata$batch, main = "Unwanted batch variation")
   
    ## Normalise using RUV-random clustering method
    ##Not run
    #norm_ruvrandclust <- NormQcmets(featuredata, method = "ruvrandclust", qcmets = qcmets, k = 2)
    #PcaPlots(norm_ruvrandclust$featuredata, factors)
    #PcaPlots(norm_ruvrandclust$uvdata, sampledata$batch, main = "Unwanted batch variation")
        
    




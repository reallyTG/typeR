library(NormalizeMets)


### Name: NormQcsamples
### Title: Normalisation methods based on quality control samples
### Aliases: NormQcsamples

### ** Examples


##Reading the data
data(Didata)
NormQcsamples(sampledata=Didata$sampledata[order(Didata$sampledata$order),],
              featuredata=Didata$featuredata[order(Didata$sampledata$order),],
              saveoutput=FALSE)
              
    




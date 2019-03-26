library(NormalizeMets)


### Name: NormCombined
### Title: Normalisation methods based on a combination of methods
### Aliases: NormCombined

### ** Examples

 ##Reading the data
 data(Didata)
 NormCombined(featuredata=Didata$featuredata[order(Didata$sampledata$order),],
            sampledata=Didata$sampledata[order(Didata$sampledata$order),],
            methods=c("rlsc", "median"),
            savefinaloutput=FALSE, 
            finaloutputname=NULL)


    




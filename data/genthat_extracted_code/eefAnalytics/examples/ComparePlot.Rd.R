library(eefAnalytics)


### Name: ComparePlot
### Title: A plot function to compare diferent eefAnalytics S3 objects from
###   the eefAnalytics package.
### Aliases: ComparePlot

### ** Examples

if(interactive()){

data(mstData)
###############
##### SRT #####
###############

outputSRT <- srtFREQ(Posttest~ Intervention + Prettest,
                     intervention = "Intervention", data = mstData)

outputSRTBoot <- srtFREQ(Posttest~ Intervention + Prettest,
                         intervention = "Intervention",nBoot=1000, data = mstData)

###############
##### MST #####
###############

outputMST <- mstFREQ(Posttest~ Intervention + Prettest, 
                     random = "School", intervention = "Intervention", data = mstData)

outputMSTBoot <- mstFREQ(Posttest~ Intervention + Prettest, 
                         random = "School", intervention = "Intervention", 
                         nBoot = 1000, data = mstData)

##################
##### Bayesian #####
##################

outputMSTbayes <- mlmBayes(Posttest~ Intervention + Prettest, 
                           random = "School", intervention = "Intervention",
                           nSim = 10000, data = mstData)


## comparing different results

ComparePlot(list(outputSRT,outputSRTBoot,outputMST,outputMSTBoot,outputMSTbayes),
            modelNames =c("ols", "olsBoot","MLM","MLMBoot","MLMBayes"),group=1)


}




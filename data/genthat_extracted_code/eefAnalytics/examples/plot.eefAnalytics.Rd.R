library(eefAnalytics)


### Name: plot.eefAnalytics
### Title: A plot method for the an eefAnalytics S3 object obtained from
###   the eefAnalytic package.
### Aliases: plot.eefAnalytics

### ** Examples

if(interactive()){

#### read data
data(mstData)
data(crtData)


###############
##### SRT #####
###############

##### Bootstrapped

outputSRTBoot <- srtFREQ(Posttest~ Intervention + Prettest,
                         intervention = "Intervention",nBoot=1000, data = mstData)
plot(outputSRTBoot,group=1)

##### Permutation
outputSRTPerm <- srtFREQ(Posttest~ Intervention + Prettest,
                         intervention = "Intervention",nPerm=1000, data = mstData)

plot(outputSRTPerm,group=1)


###############
##### MST #####
###############


#### Random intercepts
outputMST <- mstFREQ(Posttest~ Intervention + Prettest, 
                     random = "School", intervention = "Intervention", data = mstData)
plot(outputMST)


#### Bootstrapped
outputMSTBoot <- mstFREQ(Posttest~ Intervention + Prettest, 
                         random = "School", intervention = "Intervention", 
                         nBoot = 1000, data = mstData)

plot(outputMSTBoot)
plot(outputMSTBoot,group=1)

#### Permutation
outputMSTPerm <- mstFREQ(Posttest~ Intervention + Prettest, 
                         random = "School", intervention = "Intervention",
                         nPerm = 1000, data = mstData)
plot(outputMSTPerm)
plot(outputMSTPerm,group=1)


####################
##### Bayesian #####
####################


outputMSTbayes <- mlmBayes(Posttest~ Intervention + Prettest, 
                           random = "School", intervention = "Intervention",
                           nSim = 10000, data = mstData)

## Random intercepts
plot(outputMSTbayes)

## Probability of effect size greater than a precified threshold
plot(outputMSTbayes,group=1)

###############
##### CRT #####
###############

#### Random intercepts
outputCRT <- crtFREQ(Posttest~ Intervention + Prettest, random = "School", 
                     intervention = "Intervention", data = crtData)
plot(outputCRT)


## Bootstrapped
outputCRTBoot <- crtFREQ(Posttest~ Intervention + Prettest, random = "School", 
                         intervention = "Intervention", nBoot = 1000, data = crtData)

plot(outputCRTBoot,group=1)


##Permutation
outputCRTPerm <- crtFREQ(Posttest~ Intervention + Prettest, random = "School", 
                         intervention = "Intervention", nPerm = 1000, data = crtData)

plot(outputCRTPerm,group=1)


## Bayesain
outputCRTbayes <- mlmBayes(Posttest~ Intervention + Prettest, random = "School", 
                           intervention = "Intervention", nSim = 10000, data = crtData)

plot(outputCRTbayes,group=1)



################
##### CACE #####
################

outputSRTCace <- caceSRTBoot(Posttest~ Intervention + Prettest,
                             intervention = "Intervention",compliance="Percentage_Attendance",
                             nBoot=1000, data = mstData) 
plot(outputSRTCace)



outputMSTCace <- caceMSTBoot(Posttest~ Intervention + Prettest,random="School",
                             intervention = "Intervention",compliance="Percentage_Attendance",
                             nBoot=1000, data = mstData) 
plot(outputMSTCace)


outputCRTCace <- caceCRTBoot(Posttest~ Intervention + Prettest,random="School",
                             intervention = "Intervention",compliance="Percentage_Attendance",
                             nBoot=1000, data = crtData) 
plot(outputCRTCace)
}




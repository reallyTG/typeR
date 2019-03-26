library(medfate)


### Name: tissuemoisture
### Title: Tissue moisture functions
### Aliases: moisture.symplasticRWC moisture.symplasticPsi
###   moisture.apoplasticRWC moisture.apoplasticPsi moisture.tissueRWC
###   moisture.tissueFMC moisture.pressureVolumeCurvePlot

### ** Examples

psi = seq(-10,0, by=0.1)
rwc_s = rep(NA, length(psi))
for(i in 1:length(psi)) rwc_s[i] = moisture.symplasticRWC(psi[i],-3,12)
plot(psi, rwc_s, type="l", xlab="Water potential (MPa)", ylab = "Symplasmic RWC")




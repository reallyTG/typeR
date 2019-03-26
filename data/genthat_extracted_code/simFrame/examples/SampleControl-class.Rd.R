library(simFrame)


### Name: SampleControl-class
### Title: Class "SampleControl"
### Aliases: SampleControl-class SampleControl
###   getDesign,SampleControl-method setDesign,SampleControl-method
###   getGrouping,SampleControl-method setGrouping,SampleControl-method
###   getCollect,SampleControl-method setCollect,SampleControl-method
###   getFun,SampleControl-method setFun,SampleControl-method
###   getSize,SampleControl-method setSize,SampleControl-method
###   getProb,SampleControl-method setProb,SampleControl-method
###   getDots,SampleControl-method setDots,SampleControl-method
###   show,SampleControl-method sampleControl-class samplecontrol-class
###   Samplecontrol-class sampleControl samplecontrol Samplecontrol
### Keywords: classes

### ** Examples

data(eusilcP)

## simple random sampling
srsc <- SampleControl(size = 20)
draw(eusilcP[, c("id", "eqIncome")], srsc)

## group sampling
gsc <- SampleControl(grouping = "hid", size = 10)
draw(eusilcP[, c("hid", "hid", "eqIncome")], gsc)

## stratified simple random sampling
ssrsc <- SampleControl(design = "region", 
    size = c(2, 5, 5, 3, 4, 5, 3, 5, 2))
draw(eusilcP[, c("id", "region", "eqIncome")], ssrsc)

## stratified group sampling
sgsc <- SampleControl(design = "region", grouping = "hid", 
    size = c(2, 5, 5, 3, 4, 5, 3, 5, 2))
draw(eusilcP[, c("hid", "id", "region", "eqIncome")], sgsc)




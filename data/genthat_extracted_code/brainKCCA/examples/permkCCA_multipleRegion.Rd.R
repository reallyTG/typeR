library(brainKCCA)


### Name: permkCCA_multipleRegion
### Title: Calculation of Strength of the Connectivity among multiple Brain
###   Regions
### Aliases: permkCCA_multipleRegion

### ** Examples

## No test: 
#It will take more than 10 s to run
#write data into temp file
filePath <- tempdir()
#the nii.gz fMRI imaging file is created (toy example)
oro.nifti::writeNIfTI(brainKCCA::input_img, paste(filePath, "/",  "temp", sep=""))
#read fMRI data
testcase1 <- nii2RData(niiFile1 = "temp", resolution = "3mm", imgPath = filePath)
result1<-permkCCA_multipleRegion(imageDat = testcase1, region = c(1,5,10))
## End(No test)




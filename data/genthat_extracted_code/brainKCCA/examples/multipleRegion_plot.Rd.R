library(brainKCCA)


### Name: multipleRegion_plot
### Title: Multiple Regions Connection Plot
### Aliases: multipleRegion_plot

### ** Examples

## No test: 
#It will take more than 3 min to run
#write data into temp file
filePath <- tempdir()
#the nii.gz fMRI imaging file is created (toy example)
oro.nifti::writeNIfTI(brainKCCA::input_img, paste(filePath, "/",  "temp", sep=""))
#read fMRI data
testcase1 <- nii2RData(niiFile1 = "temp", resolution = "3mm", imgPath = filePath)
result1<-permkCCA_multipleRegion(imageDat = testcase1, region = c(1,5,10))
multipleRegion_plot(result1, view="axial")
## End(No test)




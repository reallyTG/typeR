library(brainKCCA)


### Name: nii2RData
### Title: Read NIfTI Image(s) File(s) into R data
### Aliases: nii2RData

### ** Examples

## No test: 
#It will take more than 10 s to run
#write data into temp file
filePath <- tempdir()
#the nii.gz fMRI imaging file is created (toy example)
oro.nifti::writeNIfTI(brainKCCA::input_img, paste(filePath, "/",  "temp", sep=""))
#read fMRI data
testcase1 <- nii2RData(niiFile1 = "temp", resolution = "3mm", imgPath = filePath)
## End(No test)




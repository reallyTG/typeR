library(brainKCCA)


### Name: meanConnection
### Title: Calculate percentage of connection in all pairwise brain
###   regions.
### Aliases: meanConnection

### ** Examples

## No test: 
#It will take more than 3 min to run
filePath <- tempdir()
#the nii.gz fMRI imaging file is created (toy example)
oro.nifti::writeNIfTI(brainKCCA::input_img, paste(filePath, "/",  "temp", sep=""))
#read fMRI data
testcase1 <- nii2RData(niiFile1 = "temp", resolution = "3mm", imgPath = filePath)
result1<-permkCCA_multipleRegion(imageDat = testcase1, region = c(1,5,10))
summary_result1 <- summary_kcca(kcca_object=result1, saveFormat = "excel")
write.csv(summary_result1, paste(filePath, "/",  "temp.csv", sep=""))
summary_data <- meanConnection(path = filePath, threshold=0.25)
multipleRegion_plot(summary_data, significance=NA)
## End(No test)




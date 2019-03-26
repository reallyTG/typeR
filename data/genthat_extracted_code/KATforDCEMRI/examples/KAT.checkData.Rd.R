library(KATforDCEMRI)


### Name: KAT.checkData
### Title: Checks and converts your data to the RData file format.
### Aliases: KAT.checkData
### Keywords: data check

### ** Examples

## Create temporary directory for benchmark example code output files
temp_dir <- tempdir(check=FALSE)
##
current_dir <- getwd()
setwd(temp_dir)
##
## Run example code
data(dcemri.data, package="KATforDCEMRI")
a1=dcemri.data$vectorTimes
a2=dcemri.data$mapCC
a3=dcemri.data$maskROI
a4=dcemri.data$vectorAIF
KAT.checkData("f",vector.times=a1,map.CC=a2,mask.ROI=a3,vector.AIF=a4,write.data.to.file=TRUE)
##
setwd(current_dir)




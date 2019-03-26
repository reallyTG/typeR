library(KATforDCEMRI)


### Name: KAT
### Title: Kinetic Analysis Tool for DCE-MRI
### Aliases: KAT
### Keywords: kinetic DCEMRI

### ** Examples

## Create temporary directory for example code output files
temp_dir <- tempdir(check=FALSE)
##
current_dir <- getwd()
setwd(temp_dir)
##
## Run example code
demo(KAT, ask=FALSE)
##
setwd(current_dir)
##
## ANALYZE DATA FROM A SINGLE DCE-MRI SCAN
##
## Load MATLAB files into R
## R> aif <- readMat("mydatafile-AIF.mat")$aif
## R> ct <- readMat("mydatafile-CT.mat")$ct
## R> roi <- readMat("mydatafile-ROILES.mat")$roi
## R> tvec <- readMat("mydatafile-TVEC.mat")$tvec
##
## Check that the dimensionality of the loaded data is consistent and save
## as a single R object or RData file
## R> dcemri.data <- KAT.checkData(file.name="mydatafile", vector.times=tvec,
##    map.CC=ct, mask.ROI=roi, vector.AIF=aif)
##
## Fit the Tofts and extended Tofts model to all ROIs in RData file
## R> KAT(file="mydatafile.RData", results_file= "mydatafile_out",
## show.rt.fits=TRUE, AIFshift="VEIN")
##
## Plot all ROIs in a single figure
## R> KAT.plot(F1="mydatafile_out_slice3.RData",
##    F2="mydatafile_out_slice4.RData", F3="mydatafile_out_slice5.RData",
##    F4="mydatafile_out_slice6.RData")
##
## Visualize and explore a parametric map for a single ROI
## R> KAT(file="mydatafile_out_slice6.RData")




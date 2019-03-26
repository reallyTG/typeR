library(KATforDCEMRI)


### Name: KAT.plot
### Title: Plots multiple image slices.
### Aliases: KAT.plot
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
file1="KAT_benchmark_test-full_slice1.RData"
file2="KAT_benchmark_test-full_slice2.RData"
file3="KAT_benchmark_test-full_slice3.RData"
file4="KAT_benchmark_test-full_slice4.RData"
KAT.plot(F1=file1, F2=file2, F3=file3, F4=file4, export.matlab=FALSE)
##
setwd(current_dir)




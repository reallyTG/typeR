library(GENEAread)


### Name: GENEAread-package
### Title: A package to process binary accelerometer output files.
### Aliases: GENEAread-package read.bin GENEAread-packages

### ** Examples

requireNamespace("GENEAread")
binfile = system.file("binfile/TESTfile.bin", package = "GENEAread")[1]
#Read in the entire file, calibrated
procfile<-read.bin(binfile)
# print(procfile)
# procfile$data.out[1:5,]
# Uncalibrated, mmap off
procfile2<-read.bin(binfile, calibrate = FALSE)
# procfile2$data.out[1:5,]
#Read in again, reusing already computed mmap pagerefs
# procfile3<-read.bin(binfile, pagerefs = procfile2$pagerefs )
#Downsample by a factor of 10
procfilelo<-read.bin(binfile, downsample = 10)
# print(procfilelo)
object.size(procfilelo) / object.size(procfile)
#Read in a 1 minute interval
procfileshort <- read.bin(binfile, start = "16:50", end = "16:51")
# print(procfileshort)
##NOT RUN: Read, and save as a R workspace
#read.bin(binfile, outfile="tmp.Rdata")
#print(load("tmp.Rdata"))
#print(processedfile)




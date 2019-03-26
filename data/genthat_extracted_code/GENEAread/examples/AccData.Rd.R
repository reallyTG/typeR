library(GENEAread)


### Name: AccData
### Title: Accelerometer Data Onject
### Aliases: AccData
### Keywords: datasets

### ** Examples

requireNamespace("GENEAread")
binfile  = system.file("binfile/TESTfile.bin", package = "GENEAread")[1]
#Read in the entire file, calibrated
procfile<-read.bin(binfile)
print(procfile)

plot(procfile$temperature,
xlim = c(min(procfile$data.out[,1]),
        max(procfile$data.out[,1])),
ylim = c(10,40))

plot(procfile$data.out[,c(1,7)])




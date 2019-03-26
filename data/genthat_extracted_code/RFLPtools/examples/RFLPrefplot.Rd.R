library(RFLPtools)


### Name: RFLPrefplot
### Title: Function for a visual comparison of RFLP samples with reference
###   samples.
### Aliases: RFLPrefplot
### Keywords: multivariate

### ** Examples

data(RFLPdata)
data(RFLPref)
dev.new(width = 12)
RFLPrefplot(RFLPdata, RFLPref, nrBands = 4, cex.axis = 0.5)

dev.new()
RFLPrefplot(RFLPdata, RFLPref, nrBands = 6, cex.axis = 0.8)
RFLPrefplot(RFLPdata, RFLPref, nrBands = 9, cex.axis = 0.8)

RFLPrefplot(RFLPdata, RFLPref[RFLPref$Sample == "Ni_29_A3",], nrBands = 4, cex.axis = 0.7)

Dir <- system.file("extdata", package = "RFLPtools") # input directory 
filename <- file.path(Dir, "AZ091016_report.txt")
RFLP1 <- read.rflp(file = filename)
RFLP2 <- RFLPqc(RFLP1)

dev.new(width = 12)
RFLPrefplot(RFLP1, RFLPref, nrBands = 4, cex.axis = 0.8)

dev.new()
RFLPrefplot(RFLP1, RFLPref, nrBands = 5, cex.axis = 0.8)




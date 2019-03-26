library(RFLPtools)


### Name: RFLPdist2ref
### Title: Compute distance between RFLP data and RFLP reference data.
### Aliases: RFLPdist2ref
### Keywords: multivariate cluster

### ** Examples

## Euclidean distance
data(RFLPdata)
data(RFLPref)
nrBands(RFLPref)
RFLPdist2ref(RFLPdata, RFLPref, nrBands = 4)
RFLPdist2ref(RFLPdata, RFLPref, nrBands = 6)

Dir <- system.file("extdata", package = "RFLPtools") # input directory 
filename <- file.path(Dir, "AZ091016_report.txt")
RFLP1 <- read.rflp(file = filename)
RFLP2 <- RFLPqc(RFLP1)
nrBands(RFLP2)
RFLPdist2ref(RFLP1, RFLPref, nrBands = 4)
RFLPdist2ref(RFLP1, RFLPref, nrBands = 5)




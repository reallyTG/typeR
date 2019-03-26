library(bPeaks)


### Name: baseLineCalc
### Title: Function to calculate the average number of reads mapped on each
###   nucleotide in a genome
### Aliases: baseLineCalc
### Keywords: genome coverage read depth

### ** Examples

# get library
library(bPeaks)

# get PDR1 data
data(dataPDR1)

# mean genome-wide read depth in IP data
meanIPcov = baseLineCalc(dataPDR1$IPdata[,3])
print(meanIPcov)

# mean genome-wide read depth in control data
meanContCov = baseLineCalc(dataPDR1$controlData[,3])
print(meanContCov) 




library(ODS)


### Name: secondary_ODS
### Title: Secondary analysis in ODS design
### Aliases: secondary_ODS

### ** Examples

library(ODS)
# take the example data from the ODS package
# please see the documentation for details about the data set ods_data_secondary
data <- ods_data_secondary

# divide the original cohort data into SRS, lowerODS, upperODS and NVsample
SRS <- data[data[,1]==1,2:ncol(data)]
lowerODS <- data[data[,1]==2,2:ncol(data)]
upperODS <- data[data[,1]==3,2:ncol(data)]
NVsample <- data[data[,1]==0,2:ncol(data)]

# obtain the cut off points for ODS design. For this data, the ODS design
# uses mean plus and minus one standard deviation of Y1 as cut off points.
meanY1 <- mean(data[,2])
sdY1 <- sd(data[,2])
cutpoint <- c(meanY1-sdY1, meanY1+sdY1)

# the data matrix SRS has Y1, Y2, X and Z. Hence the dimension of Z is ncol(SRS)-3.
Z.dim <- ncol(SRS)-3

secondary_ODS(SRS, lowerODS, upperODS, NVsample, cutpoint, Z.dim)




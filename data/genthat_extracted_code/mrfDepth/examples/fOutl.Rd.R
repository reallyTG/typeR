library(mrfDepth)


### Name: fOutl
### Title: Functional outlyingness measures for functional data
### Aliases: fOutl
### Keywords: functional

### ** Examples

# We will illustrate the function using a univariate functional sample.
data(octane)
Data <- octane

# When the option diagnostic is set to TRUE, a crude diagnostic
# to detect outliers can be extracted from the local outlyingness
# indicators. 
Result <- fOutl(x = Data, type = "fAO", diagnostic = TRUE)
matplot(Data[,,1], type = "l", col = "black", lty = 1)
for (i in 1:dim(Data)[2]) {
  if(sum(Result$locOutlZ) > 0) {
    obsData <- matrix(Data[,i,1], nrow = 1)
    obsData[!Result$locOutlZ[i,]] <- NA
    obsData <- rbind(obsData, obsData)
    matpoints(t(obsData), col = "red", pch = 15)
  }
}
# For more advance outlier detection techniques, see the 
# fom routine.




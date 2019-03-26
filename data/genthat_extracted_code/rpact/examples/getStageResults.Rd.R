library(rpact)


### Name: getStageResults
### Title: Get Stage Results
### Aliases: getStageResults

### ** Examples

design <- getDesignInverseNormal()
dataRates <- getDataset(
    n1 = c(10,10),
    n2 = c(20,20),
    events1 = c(8,10),
    events2 = c(10,16))

getStageResults(design, dataRates)

# produces:
#
# Stage results of rates:
#   Stages                     : 1, 2, 3 
#   Overall test statistics    : 1.581, 2.064, NA 
#   Overall p-values           : 0.05692, 0.01949, NA 
#   Overall events (1)         : 8, 18 
#   Overall events (2)         : 10, 26 
#   Overall sample sizes (1)   : 10, 20 
#   Overall sample sizes (2)   : 20, 40 
#   Test statistics            : 1.581, 1.519, NA 
#   p-values                   : 0.05692, 0.06437, NA 
#   Effect sizes               : 0.30, 0.25, NA 
#   Inverse Normal Combination : 1.581, 2.192, NA 
#   Weights Inverse Normal     : 0.577, 0.577, 0.577 
#   Theta H0                   : 0 
#   Direction                  : upper 
#   Normal approximation       : TRUE 





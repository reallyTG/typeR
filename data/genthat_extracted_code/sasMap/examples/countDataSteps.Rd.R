library(sasMap)


### Name: countDataSteps
### Title: Count number of data steps in a SAS file
### Aliases: countDataSteps

### ** Examples

sasFile <- system.file('examples/SAScode/MainAnalysis.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
countDataSteps(sasCode)




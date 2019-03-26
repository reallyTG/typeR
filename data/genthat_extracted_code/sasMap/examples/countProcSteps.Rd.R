library(sasMap)


### Name: countProcSteps
### Title: Count number of proc steps in a SAS file
### Aliases: countProcSteps

### ** Examples

sasFile <- system.file('examples/SAScode/MainAnalysis.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
countProcSteps(sasCode)




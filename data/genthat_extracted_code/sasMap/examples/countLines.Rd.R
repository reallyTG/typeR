library(sasMap)


### Name: countLines
### Title: Count lines in a SAS file
### Aliases: countLines

### ** Examples

sasFile <- system.file('examples/SAScode/MainAnalysis.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
countLines(sasCode)




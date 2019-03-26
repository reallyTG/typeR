library(sasMap)


### Name: countStatements
### Title: Count statements in a SAS file
### Aliases: countStatements

### ** Examples

sasFile <- system.file('examples/SAScode/MainAnalysis.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
countStatements(sasCode)




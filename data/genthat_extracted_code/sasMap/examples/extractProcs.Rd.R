library(sasMap)


### Name: extractProcs
### Title: Extract procs from a vector of SAS code
### Aliases: extractProcs

### ** Examples

sasFile <- system.file('examples/SAScode/Macros/Util1.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
extractProcs(sasCode)




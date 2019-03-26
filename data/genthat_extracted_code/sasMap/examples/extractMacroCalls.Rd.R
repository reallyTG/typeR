library(sasMap)


### Name: extractMacroCalls
### Title: Extract macro calls from a string of SAS code
### Aliases: extractMacroCalls

### ** Examples

sasFile <- system.file('examples/SAScode/Macros/Util1.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
extractMacroCalls(sasCode)




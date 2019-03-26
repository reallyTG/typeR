library(sasMap)


### Name: extractMacroDefs
### Title: Extract macro definitions from a string of SAS code
### Aliases: extractMacroDefs

### ** Examples

sasFile <- system.file('examples/SAScode/Macros/Util1.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
extractMacroDefs(sasCode)




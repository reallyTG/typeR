library(sasMap)


### Name: removeWhitespaceCharacters
### Title: Remove whitespace characters from SAS code
### Aliases: removeWhitespaceCharacters

### ** Examples

sasFile <- system.file('examples/SAScode/Macros/Util2.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
removeWhitespaceCharacters(sasCode)




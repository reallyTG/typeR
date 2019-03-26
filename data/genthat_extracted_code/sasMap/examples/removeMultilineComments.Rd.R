library(sasMap)


### Name: removeMultilineComments
### Title: Remove multiline comments from SAS code
### Aliases: removeMultilineComments

### ** Examples

sasFile <- system.file('examples/SAScode/Macros/Util2.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
removeMultilineComments(sasCode)




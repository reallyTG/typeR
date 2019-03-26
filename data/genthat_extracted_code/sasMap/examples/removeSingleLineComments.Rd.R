library(sasMap)


### Name: removeSingleLineComments
### Title: Remove single line comments from a vector of SAS statements
### Aliases: removeSingleLineComments

### ** Examples

sasFile <- system.file('examples/SAScode/Macros/Util2.SAS', package='sasMap')
sasCode <- loadSAS(sasFile)
removeAllComments(sasCode)




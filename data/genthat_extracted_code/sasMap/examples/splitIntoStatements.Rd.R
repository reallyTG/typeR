library(sasMap)


### Name: splitIntoStatements
### Title: Split SAS code into statements
### Aliases: splitIntoStatements

### ** Examples

sasPath <- system.file('examples/SAScode/Macros/fun2.SAS', package='sasMap')
sasCode <- loadSAS(sasPath)
splitIntoStatements(sasCode)




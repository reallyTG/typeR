library(RXMCDA)


### Name: getPerformanceTables
### Title: Get performance tables
### Aliases: getPerformanceTables
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata","testFile.xml",package="RXMCDA"), 
                     useInternalNodes=TRUE)

tables <- getPerformanceTables(tree)




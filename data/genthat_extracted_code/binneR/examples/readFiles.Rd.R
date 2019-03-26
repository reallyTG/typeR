library(binneR)


### Name: readFiles
### Title: Read and process mulitple data files
### Aliases: readFiles

### ** Examples

res <- readFiles(list.files(system.file('mzML',package = 'binneR'),
                 full.names=TRUE),dp = 2,scans = 6:17)




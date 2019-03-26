library(RepoGenerator)


### Name: createDownloadText
### Title: createDownloadText
### Aliases: createDownloadText

### ** Examples


dataList <- read.csv(system.file('metadata/DataList.csv', package='RepoGenerator'), 
    stringsAsFactors=FALSE, header=TRUE)
cat(RepoGenerator:::createDownloadText(dataList))





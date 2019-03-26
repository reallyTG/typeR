library(bdDwC)


### Name: renameUserData
### Title: Rename Dataset According Darwinized Names
### Aliases: renameUserData

### ** Examples

result <- darwinizeNames(dataUser = bdDwC:::dataReptiles, 
                         dataDWC =  bdDwC:::dataDarwinCloud$data)
renameUserData(bdDwC:::dataReptiles, result)





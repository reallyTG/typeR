library(berryFunctions)


### Name: compareFiles
### Title: Compare textfiles for equality
### Aliases: compareFiles
### Keywords: IO character file

### ** Examples


filenames <- system.file(paste0("extdata/versuch",1:2,".txt"), package="berryFunctions")
compareFiles(filenames[1], filenames[2], warn=FALSE)





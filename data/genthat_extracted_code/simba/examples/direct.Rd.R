library(simba)


### Name: direct
### Title: Obtain Direction Classes from Geographic Coordinates
### Aliases: direct direct2
### Keywords: methods

### ** Examples

data(abis)
dirclass <- direct(abis.env[,1:2])
dirclass
dirclass.ls <- direct(abis.env[,1:2], listout=TRUE)
dirclass.ls




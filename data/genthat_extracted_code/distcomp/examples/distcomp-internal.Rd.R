library(distcomp)


### Name: .makeOpencpuURL
### Title: Make an appropriate opencpu URL for a specified function and url
###   prefix for the distcomp package
### Aliases: .makeOpencpuURL .defnOK .deSerialize
### Keywords: internal

### ** Examples

distcomp:::.makeOpencpuURL("foo", "http://localhost:9999/ocpu")

distcomp:::.defnOK(data.frame()) ## FALSE
distcomp:::.defnOK(data.frame(id = "ABC", stringsAsFactors=FALSE)) ## TRUE





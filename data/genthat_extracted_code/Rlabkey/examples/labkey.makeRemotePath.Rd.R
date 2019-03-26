library(Rlabkey)


### Name: labkey.makeRemotePath
### Title: Build a file path to data on a remote machine
### Aliases: labkey.makeRemotePath
### Keywords: file

### ** Examples


# library(Rlabkey)

labkey.pipeline.root <- "c:/data/fcs"
labkey.remote.pipeline.root <- "/volumes/fcs"
fcsFile <- "c:/data/fcs/runA/aaa.fcs"

# returns "/volumes/fcs/runA/aaa.fcs
labkey.makeRemotePath(
	localRoot=labkey.pipeline.root,
	remoteRoot=labkey.remote.pipeline.root,
	fullPath=fcsFile);





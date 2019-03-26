library(fat2Lpoly)


### Name: read.merlin.files
### Title: function to read input files in Merlin format
### Aliases: read.merlin.files

### ** Examples

path.data=paste(.libPaths()[which(unlist(lapply(.libPaths(),
function(x) length(grep("fat2Lpoly",dir(x)))))>0)],
"/fat2Lpoly/extdata/",sep="")
if(length(path.data)>1) path.data=path.data[length(path.data)]

input.data=read.merlin.files(pedfilenames=
                  paste(path.data,c("loc1.ped","loc2.ped"),sep=""),
                  datfilenames=
				paste(path.data,c("loc1.dat","loc2.dat"),sep=""),
			      freq.data=
			      paste(path.data,c("loc1.freq","loc2.freq"),sep=""),
                       ibdfilenames=
				paste(path.data,c("loc1.ibd","loc2.ibd"),sep=""))

input.data2=read.merlin.files(pedfilenames=
					paste(path.data,"loc2.ped",sep=""),
                            datfilenames=
                            paste(path.data,"loc2.dat",sep=""),
                            freq.data=
                            paste(path.data,"loc2.freq",sep=""),
					ibdfilenames=
					paste(path.data,"loc2.ibd",sep=""))




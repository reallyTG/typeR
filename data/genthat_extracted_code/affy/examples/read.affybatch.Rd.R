library(affy)


### Name: read.affybatch
### Title: Read CEL files into an AffyBatch
### Aliases: read.affybatch AllButCelsForReadAffy ReadAffy
### Keywords: manip

### ** Examples

if(require(affydata)){
     celpath <- system.file("celfiles", package="affydata")
     fns <- list.celfiles(path=celpath,full.names=TRUE)
 
     cat("Reading files:\n",paste(fns,collapse="\n"),"\n")
     ##read a binary celfile
     abatch <- ReadAffy(filenames=fns[1])
     ##read a text celfile
     abatch <- ReadAffy(filenames=fns[2])
     ##read all files in that dir
     abatch <- ReadAffy(celfile.path=celpath)
}




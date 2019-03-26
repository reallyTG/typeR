library(RProtoBuf)


### Name: readProtoFiles
### Title: protocol buffer descriptor importer
### Aliases: readProtoFiles readProtoFiles2 resetDescriptorPool
### Keywords: programming

### ** Examples

## Not run: 
##D # from a package
##D readProtoFiles(package = "RProtoBuf")
##D 
##D # from a directory
##D proto.dir <- system.file("proto", package = "RProtoBuf")
##D readProtoFiles(dir = proto.dir)
##D 
##D # set of files
##D proto.files <- list.files(proto.dir, full.names = TRUE)
##D readProtoFiles(proto.files)
## End(Not run)




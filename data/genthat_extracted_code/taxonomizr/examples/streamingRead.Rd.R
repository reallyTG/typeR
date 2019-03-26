library(taxonomizr)


### Name: streamingRead
### Title: Process a large file piecewise
### Aliases: streamingRead

### ** Examples

tmpFile<-tempfile()
writeLines(LETTERS,tmpFile)
streamingRead(tmpFile,10,head,1)
writeLines(letters,tmpFile)
streamingRead(tmpFile,2,paste,collapse='',vocal=TRUE)
unlist(streamingRead(tmpFile,2,sample,1))




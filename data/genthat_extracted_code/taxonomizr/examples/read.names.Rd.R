library(taxonomizr)


### Name: read.names
### Title: Read NCBI names file
### Aliases: read.names

### ** Examples

namesText<-c(
  "1\t|\tall\t|\t\t|\tsynonym\t|",
  "1\t|\troot\t|\t\t|\tscientific name\t|",
  "2\t|\tBacteria\t|\tBacteria <prokaryotes>\t|\tscientific name\t|",
  "2\t|\tMonera\t|\tMonera <Bacteria>\t|\tin-part\t|",
  "2\t|\tProcaryotae\t|\tProcaryotae <Bacteria>\t|\tin-part\t|"
)
tmpFile<-tempfile()
writeLines(namesText,tmpFile)
read.names(tmpFile)




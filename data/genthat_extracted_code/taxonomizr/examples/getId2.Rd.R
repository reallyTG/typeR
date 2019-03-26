library(taxonomizr)


### Name: getId2
### Title: Find a given taxa by name
### Aliases: getId2

### ** Examples

namesText<-c(
  "1\t|\tall\t|\t\t|\tsynonym\t|",
  "1\t|\troot\t|\t\t|\tscientific name\t|",
  "3\t|\tMulti\t|\tBacteria <prokaryotes>\t|\tscientific name\t|",
  "4\t|\tMulti\t|\tBacteria <prokaryotes>\t|\tscientific name\t|",
  "2\t|\tBacteria\t|\tBacteria <prokaryotes>\t|\tscientific name\t|",
  "2\t|\tMonera\t|\tMonera <Bacteria>\t|\tin-part\t|",
  "2\t|\tProcaryotae\t|\tProcaryotae <Bacteria>\t|\tin-part\t|"
)
tmpFile<-tempfile()
writeLines(namesText,tmpFile)
names<-read.names(tmpFile)
getId2('Bacteria',names)
getId2('Not a real name',names)
getId2('Multi',names)




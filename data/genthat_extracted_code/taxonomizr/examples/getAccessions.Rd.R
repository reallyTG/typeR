library(taxonomizr)


### Name: getAccessions
### Title: Find all accessions for a taxa
### Aliases: getAccessions

### ** Examples

taxa<-c(
  "accession\taccession.version\ttaxid\tgi",
  "Z17427\tZ17427.1\t3702\t16569",
  "Z17428\tZ17428.1\t3702\t16570",
  "Z17429\tZ17429.1\t3702\t16571",
  "Z17430\tZ17430.1\t3702\t16572"
)
inFile<-tempfile()
outFile<-tempfile()
writeLines(taxa,inFile)
read.accession2taxid(inFile,outFile)
getAccessions(3702,outFile)




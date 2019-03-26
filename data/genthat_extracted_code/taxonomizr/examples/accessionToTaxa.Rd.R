library(taxonomizr)


### Name: accessionToTaxa
### Title: Convert accessions to taxa
### Aliases: accessionToTaxa

### ** Examples

taxa<-c(
 "accession\taccession.version\ttaxid\tgi",
 "Z17427\tZ17427.1\t3702\t16569",
 "Z17428\tZ17428.1\t3702\t16570",
 "Z17429\tZ17429.1\t3702\t16571",
 "Z17430\tZ17430.1\t3702\t16572",
 "X62402\tX62402.1\t9606\t30394"
)
inFile<-tempfile()
sqlFile<-tempfile()
writeLines(taxa,inFile)
read.accession2taxid(inFile,sqlFile,vocal=FALSE)
accessionToTaxa(c("Z17430.1","Z17429.1","X62402.1",'NOTREAL'),sqlFile)




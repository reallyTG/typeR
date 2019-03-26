library(qoma.smuggler)


### Name: write_fame
### Title: Write FAME db
### Aliases: write_fame

### ** Examples

mydb <- List()
# construct an entry for FAME scalar string
entry <- newEntry('String contents',class=rhli::HSCALA,type=rhli::HSTRNG)
mydb$put('str',entry)
dbfile <- file.path(tempdir(),'tmp.db')
write_fame(dbfile,mydb)





library(AnnotationDbi)


### Name: AnnotationDb-objects
### Title: AnnotationDb objects and their progeny, methods etc.
### Aliases: AnnotationDb class:AnnotationDb AnnotationDb-class
###   ChipDb-class GODb-class InparanoidDb-class OrgDb-class
###   ReactomeDb-class loadDb dbconn,AnnotationDb-method saveDb
###   saveDb,AnnotationDb-method show,AnnotationDb-method
###   metadata,AnnotationDb-method names,AnnotationDb-method species
###   species,AnnotationDb-method dbfile,AnnotationDb-method taxonomyId
###   taxonomyId,AnnotationDb-method cols columns
###   columns,AnnotationDb-method columns,OrgDb-method
###   columns,ChipDb-method columns,GODb-method columns,InparanoidDb-method
###   columns,Inparanoid8Db-method columns,ReactomeDb-method keytypes
###   keytypes,OrgDb-method keytypes,ChipDb-method keytypes,GODb-method
###   keytypes,InparanoidDb-method keytypes,Inparanoid8Db-method
###   keytypes,ReactomeDb-method keys keys,OrgDb-method keys,ChipDb-method
###   keys,GODb-method keys,InparanoidDb-method keys,Inparanoid8Db-method
###   keys,ReactomeDb-method select select,OrgDb-method
###   select,ChipDb-method select,GODb-method select,InparanoidDb-method
###   select,Inparanoid8Db-method select,ReactomeDb-method mapIds
###   mapIds,AnnotationDb-method
### Keywords: classes methods

### ** Examples

require(hgu95av2.db)
## display the columns
columns(hgu95av2.db)
## get the 1st 6 possible keys
keys <- head( keys(hgu95av2.db) )
keys
## lookup gene symbol and unigene ID for the 1st 6 keys
select(hgu95av2.db, keys=keys, columns = c("SYMBOL","UNIGENE"))

## get keys based on unigene
keyunis <- head( keys(hgu95av2.db, keytype="UNIGENE") )
keyunis
## list supported key types
keytypes(hgu95av2.db)
## lookup gene symbol and unigene ID based on unigene IDs by setting
## the keytype to "UNIGENE" and passing in unigene keys:
select(hgu95av2.db, keys=keyunis, columns = c("SYMBOL","UNIGENE"),
       keytype="UNIGENE")

keys <- head(keys(hgu95av2.db, 'ENTREZID'))
## get a default result (captures only the 1st element)
mapIds(hgu95av2.db, keys=keys, column='ALIAS', keytype='ENTREZID')
## or use a different option
mapIds(hgu95av2.db, keys=keys, column='ALIAS', keytype='ENTREZID', 
    multiVals="CharacterList")
## Or define your own function
last <- function(x){x[[length(x)]]}
mapIds(hgu95av2.db, keys=keys, column='ALIAS', keytype='ENTREZID', 
    multiVals=last)
    
## For other ways to access the DB, you can use dbfile() or dbconn() to extract
dbconn(hgu95av2.db)
dbfile(hgu95av2.db)

## Try to retrieve an associated taxonomyId 
taxonomyId(hgu95av2.db)




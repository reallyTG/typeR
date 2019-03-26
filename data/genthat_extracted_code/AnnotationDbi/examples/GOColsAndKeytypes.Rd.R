library(AnnotationDbi)


### Name: GOID
### Title: Descriptions of available values for 'columns' and 'keytypes'
###   for GO.db.
### Aliases: GOID TERM ONTOLOGY DEFINITION
### Keywords: utilities manip

### ** Examples

  library(GO.db)
  ## List the possible values for columns
  columns(GO.db)
  ## List the possible values for keytypes
  keytypes(GO.db)
  ## get some values back
  keys <- head(keys(GO.db))
  keys
  select(GO.db, keys=keys, columns=c("TERM","ONTOLOGY"),
  keytype="GOID")

  ## More infomation about the dates and original sources for these data:
  metadata(GO.db)




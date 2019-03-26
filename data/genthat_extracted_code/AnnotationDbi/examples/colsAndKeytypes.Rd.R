library(AnnotationDbi)


### Name: ACCNUM
### Title: Descriptions of available values for 'columns' and 'keytypes'.
### Aliases: ACCNUM ALIAS ARACYC ARACYCENZYME CHR CHRLOC CHRLOCEND COMMON
###   DESCRIPTION ENSEMBL ENSEMBLPROT ENSEMBLTRANS ENTREZID ENZYME EVIDENCE
###   EVIDENCEALL GENENAME GO GOALL INTERPRO IPI MAP OMIM ONTOLOGYALL ORF
###   PATH PFAM PMID PROBEID PROSITE REFSEQ SGD SMART SYMBOL TAIR UNIGENE
###   UNIPROT
### Keywords: utilities manip

### ** Examples

  library(hgu95av2.db)
  ## List the possible values for columns
  columns(hgu95av2.db)
  ## List the possible values for keytypes
  keytypes(hgu95av2.db)
  ## get some values back
  keys <- head(keys(hgu95av2.db))
  keys
  select(hgu95av2.db, keys=keys, columns=c("SYMBOL","PFAM"),
  keytype="PROBEID")

  ## More infomation about the dates and original sources for these data:
  metadata(hgu95av2.db)




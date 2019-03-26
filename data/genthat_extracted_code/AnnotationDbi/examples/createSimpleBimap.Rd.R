library(AnnotationDbi)


### Name: createSimpleBimap
### Title: Creates a simple Bimap from a SQLite database in an situation
###   that is external to AnnotationDbi
### Aliases: createSimpleBimap
### Keywords: utilities

### ** Examples

##You simply have to call this function to create a new mapping.  For
##example, you could have created a mapping between the gene_name and
##the symbols fields from the gene_info table contained in the hgu95av2
##package by doing this:
library(hgu95av2.db)
hgu95av2NAMESYMBOL <- createSimpleBimap("gene_info",
                                        "gene_name",
                                        "symbol",
                                        hgu95av2.db:::datacache,
                                        "NAMESYMBOL",
                                        "hgu95av2.db")





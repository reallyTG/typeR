library(g3viz)


### Name: hgnc2pfam
### Title: Map from Hugo symbol to Pfam domains
### Aliases: hgnc2pfam

### ** Examples

# general usage
hgnc2pfam("TP53")
hgnc2pfam("TP53", output.format = "json")
hgnc2pfam("TP53", output.format = "list")
hgnc2pfam("TP53", output.format = "json", uniprot.id = "P04637") # OK

# for gene mapping to multiple UniProt enties
hgnc2pfam("GNAS", guess = TRUE)
hgnc2pfam("GNAS", guess = FALSE)
hgnc2pfam("GNAS", output.format = "list")
hgnc2pfam("GNAS", output.format = "list", uniprot.id = "P84996")
## Not run: 
##D hgnc2pfam("GNAS", output.format = "list", uniprot.id = "P84997") # not exists, returns FALSE
## End(Not run)

hgnc2pfam("PRAMEF9", output.format = "list") # no Pfam mappings





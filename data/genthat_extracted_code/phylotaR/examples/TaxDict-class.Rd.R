library(phylotaR)


### Name: TaxDict-class
### Title: Taxonomic record dictionary
### Aliases: TaxDict-class TaxDict-method as.character,TaxDict-method
###   show,TaxDict-method print,TaxDict-method str,TaxDict-method
###   summary,TaxDict-method

### ** Examples

data('aotus')
txdct <- aotus@txdct
# this is a TaxDict object
# it contains taxonomic information, including records and tree
show(txdct)
# you can access its different data slots with @
txdct@txids  # taxonomic IDs
txdct@recs   # taxonomic records environment
txdct@txtr   # taxonomic tree
txdct@prnt   # MRCA
# access any record through the records environment
txdct@recs[[txdct@txids[[1]]]]
# for interacting with the taxonomic tree, see the treeman package
summary(txdct@txtr)




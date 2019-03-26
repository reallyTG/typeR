library(canprot)


### Name: canprot-package
### Title: Differential Expression of Proteins in Cancer
### Aliases: canprot-package
### Keywords: package

### ** Examples

# list all of the data files for protein expression
exprdata <- system.file("extdata/expression", package="canprot")
exprfiles <- dir(exprdata, recursive=TRUE)
print(exprfiles)
# get the reference keys from the filenames
refkeys <- gsub(".csv", "", sapply(strsplit(exprfiles, "/"), "[", 2))
# find the reference keys in the UniProt updates file
data(canprot)
update_keys <- unique(unlist(strsplit(uniprot_updates$source, ";")))
# find the reference keys in the extra human amino acid composition file
extra_keys <- unique(unlist(strsplit(human_extra$ref, ";")))
# list the unused keys (these should be empty when the package is released)
setdiff(update_keys, refkeys)
setdiff(extra_keys, refkeys)




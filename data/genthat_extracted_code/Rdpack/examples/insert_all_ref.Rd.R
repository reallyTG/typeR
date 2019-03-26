library(Rdpack)


### Name: insert_all_ref
### Title: Insert references cited in packages
### Aliases: insert_all_ref
### Keywords: documentation

### ** Examples

bibs <- bibtex::read.bib(package = "tools")
bibs


## a reference from package Rdpack
cat(insert_all_ref(matrix(c("Rpack:bibtex", "Rdpack"), ncol = 2)), "\n")

## more than one reference from package Rdpack, separate the keys with commas
cat(insert_all_ref(matrix(c("parseRd,Rpack:bibtex", "Rdpack"), ncol = 2)), "\n")

## all references from package Rdpack
cat(insert_all_ref(matrix(c("*", "Rdpack"), ncol = 2)), "\n")




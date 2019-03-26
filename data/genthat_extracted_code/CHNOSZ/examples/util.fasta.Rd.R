library(CHNOSZ)


### Name: util.fasta
### Title: Functions for Reading FASTA Files and Downloading from UniProt
### Aliases: util.fasta read.fasta uniprot.aa count.aa

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## reading a protein FASTA file
# the path to the file
file <- system.file("extdata/fasta/EF-Tu.aln", package="CHNOSZ")
# read the sequences, and print the first one
read.fasta(file, ret="seq")[[1]]
# count the amino acids in the sequences
aa <- read.fasta(file)
# compute lengths (number of amino acids)
protein.length(aa)

## Not run: 
##D # download amino acid composition of a protein
##D # start at position 2 to remove the initiator methionine
##D aa <- uniprot.aa("ALAT1_HUMAN", start=2)
##D # add it to thermo$protein
##D ip <- add.protein(aa)
##D # now it's possible to calculate some properties
##D protein.length(ip)
##D protein.formula(ip)
##D subcrt("ALAT1_HUMAN", c("cr", "aq"), c(-1, 1))
##D # the amino acid composition can be saved for future use
##D write.csv(aa, "saved.aa.csv", row.names=FALSE)
##D # in another R session, the protein can be loaded without using uniprot.aa()
##D aa <- read.csv("saved.aa.csv", as.is=TRUE)
##D add.protein(aa)
##D 
##D ## count amino acids in a sequence
##D count.aa("GGSGG")
##D # warnings are issued for unrecognized characters
##D atest <- count.aa("WhatAmIMadeOf?")
##D # there are 3 "A" (alanine)
##D stopifnot(atest[, "A"]==3)
## End(Not run)




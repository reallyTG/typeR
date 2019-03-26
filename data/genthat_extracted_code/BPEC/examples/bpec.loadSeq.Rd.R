library(BPEC)


### Name: bpec.loadSeq
### Title: Load sequence data
### Aliases: bpec.loadSeq

### ** Examples

#to load existing example file from BPEC
seqsFile <- system.file("haplotypes.nex",package = "BPEC")
rawSeqs <- bpec.loadSeq(seqsFile)

## Not run: 
##D #to load a different input file "haplotypes.nex"
##D rawSeqs <- bpec.loadSeq('haplotypes.nex')
## End(Not run)




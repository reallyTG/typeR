library(VLF)


### Name: aa.conservation_first
### Title: First Modal Amino Acid Conservation
### Aliases: aa.conservation_first

### ** Examples

## Not run: 
##D data(birds_aminoAcids)
##D birds_aminoAcid_count <- aa.count.function(birds_aminoAcids, 216)
##D aminoAcid_frequency.Matrix <- aa.frequency.matrix.function(birds_aminoAcid_count, 216)
##D aminoAcid_Modal <- aa.MODE(aminoAcid_frequency.Matrix, 216)
##D aminoAcid_firstModalFreq <- aa.MODE.freq(aminoAcid_frequency.Matrix, 216)
##D aminoAcid_firstConservation_100 <- aa.conservation_first(aminoAcid_firstModalFreq, 1, 216)
## End(Not run)




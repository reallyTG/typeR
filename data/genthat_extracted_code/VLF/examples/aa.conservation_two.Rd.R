library(VLF)


### Name: aa.conservation_two
### Title: First and Second Modal Amino Acid Conservation
### Aliases: aa.conservation_two

### ** Examples

## Not run: 
##D data(birds_aminoAcids)
##D birds_aminoAcid_count <- aa.count.function(birds_aminoAcids, 216)
##D aminoAcid_frequency.Matrix <- aa.frequency.matrix.function(birds_aminoAcid_count, 216)
##D aminoAcid_Modal <- aa.MODE(aminoAcid_frequency.Matrix, 216)
##D aminoAcid_firstModalFreq <- aa.MODE.freq(aminoAcid_frequency.Matrix, 216)
##D aminoAcid_secondModalFreq <- aa.MODE.second.freq(aminoAcid_frequency.Matrix, 216)
##D aminoAcid_secondConservation_99.9 <- aa.conservation_two(aminoAcid_firstModalFreq, 
##D     aminoAcid_secondModalFreq, 0.999, 216)
## End(Not run)




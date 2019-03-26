library(VLF)


### Name: VLF.convert.matrix
### Title: VLF Matrix Convert
### Aliases: VLF.convert.matrix

### ** Examples

## Not run: 
##D data(birds_aminoAcids)
##D birds_aminoAcid_speciesNames <- birds_aminoAcids[,2]
##D aminoAcids_specimenNumber <- nrow(birds_aminoAcids)
##D birds_aminoAcid_count <- aa.count.function(birds_aminoAcids, 216)
##D aminoAcid_frequency.Matrix <- aa.frequency.matrix.function(birds_aminoAcid_count, 216)
##D bird_aminoAcid_frequencies <- aa.specimen.frequencies(aminoAcid_frequency.Matrix, birds_aminoAcids,
##D     birds_aminoAcid_speciesNames, 216)
##D aminoAcid_Modal <- aa.MODE(aminoAcid_frequency.Matrix, 216)
##D birds_aminoAcid_specimenVLFcount <- aa.VLF.count.spec(bird_aminoAcid_frequencies, 0.001, 216)
##D birds_aaVLFconvert <- aa.VLF.convert.matrix(birds_aminoAcids, bird_aminoAcid_frequencies,0.001,216)
## End(Not run)




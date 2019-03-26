library(VLF)


### Name: find.matching
### Title: Find Matching ntVLF and aaVLF Specimen.
### Aliases: find.matching

### ** Examples

## Not run: 
##D #Nucleotide VLF analysis
##D data(birds)
##D species.names <- birds[,2]
##D specimen.Number <- nrow(birds)
##D rownames(birds) <- species.names
##D Nuc.count <- count.function(birds, specimen.Number, 648)
##D frequency.matrix <- ffrequency.matrix.function(Nuc.count, 648)
##D birdSpec.freq <- specimen.frequencies(frequency.matrix, birds, specimen.Number, species.names, 648)
##D Bird_specimen_VLFcount <- VLF.count.spec(birdSpec.freq, 0.001, 648)
##D bird_VLFconvert <- VLF.convert.matrix(birds, birdSpec.freq, 0.001, 648)
##D bird_VLFnuc <- VLF.nucleotides(bird_VLFconvert, birds, 648)
##D bird_VLFreduced <- VLF.reduced(bird_VLFnuc, Bird_specimen_VLFcount, 648)
##D bird_species <- separate(bird_VLFreduced)
##D birds_singleAndShared <- find.singles(bird_species, 648)
##D 
##D #Amino Acid VLF Analysis
##D data(birds_aminoAcids)
##D birds_aminoAcid_speciesNames <- birds_aminoAcids[,2]
##D aminoAcids_specimenNumber <- nrow(birds_aminoAcids)
##D birds_aminoAcid_count <- aa.count.function(birds_aminoAcids, 216)
##D aminoAcid_frequency.Matrix <- aa.frequency.matrix.function(birds_aminoAcid_count, 216)
##D bird_aminoAcid_frequencies <- aa.specimen.frequencies(aminoAcid_frequency.Matrix, birds_aminoAcids, 
##D     birds_aminoAcid_speciesNames, 216)
##D aminoAcid_Modal <- aa.MODE(aminoAcid_frequency.Matrix, 216)
##D birds_aminoAcid_specimenVLFcount <- aa.VLF.count.spec(bird_aminoAcid_frequencies, 0.001, 216)
##D birds_aaVLFconvert <- aa.VLF.convert.matrix(birds_aminoAcids, bird_aminoAcid_frequencies, 0.001, 
##D     216)
##D birds_aminoAcidVLFs <- VLF.aminoAcids(birds_aaVLFconvert, birds_aminoAcids, 216)
##D birds_aaVLFreduced <- aa.VLF.reduced(birds_aminoAcidVLFs, birds_aminoAcid_specimenVLFcount, 216)
##D birds_aaSpecies <- separate(birds_aaVLFreduced)
##D birds_aminoAcid_singleAndShared <- aa.find.singles(birds_aaSpecies, 216)
##D 
##D #Concordance Analysis
##D VLF_match <- find.matching(bird_VLFreduced, birds_aaVLFreduced, 648, 216)
## End(Not run)




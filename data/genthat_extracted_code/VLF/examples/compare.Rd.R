library(VLF)


### Name: compare
### Title: Compare VLFs within Species
### Aliases: compare

### ** Examples

## Not run: 
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
##D 
##D #The compare function is called on from within the find.singles function
##D birds_singleAndShared <- find.singles(bird_species, 648)
## End(Not run)




library(VLF)


### Name: MODE.freq
### Title: Modal Frequencies
### Aliases: MODE.freq

### ** Examples

## Not run: 
##D data(birds)
##D species.names <- birds[,2]
##D specimen.Number <- nrow(birds)
##D rownames(birds) <- species.names
##D Nuc.count <- count.function(birds, specimen.Number, 648)
##D frequency.matrix <- ffrequency.matrix.function(Nuc.count, 648)
##D birdSpec.freq <- specimen.frequencies(frequency.matrix, birds, specimen.Number, species.names, 648)
##D nucleotide.modalSequence <- MODE(frequency.matrix, 648)
##D Bird_first.modal.frequencies <- MODE.freq(frequency.matrix, 648)
## End(Not run)




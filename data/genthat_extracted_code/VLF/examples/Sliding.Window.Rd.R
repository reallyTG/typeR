library(VLF)


### Name: Sliding.Window
### Title: Sliding Window
### Aliases: Sliding.Window

### ** Examples

## Not run: 
##D data(birds)
##D species.names <- birds[,2]
##D specimen.Number <- nrow(birds)
##D rownames(birds) <- species.names
##D Nuc.count <- count.function(birds, specimen.Number, 648)
##D frequency.matrix <- ffrequency.matrix.function(Nuc.count, 648)
##D birdSpec.freq <- specimen.frequencies(frequency.matrix, birds, specimen.Number, species.names, 648)
##D Bird_position_VLFcount <- VLF.count.pos(birdSpec.freq, 0.001, 648)
##D Sliding.Window(Bird_position_VLFcount, 648)
## End(Not run)




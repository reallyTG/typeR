library(labdsv)


### Name: rndtaxa
### Title: Randomize a Taxa Data.Frame
### Aliases: rndtaxa
### Keywords: datagen

### ** Examples

    data(bryceveg) # returns a vegetation data.frame called bryceveg
    test <- rndtaxa(bryceveg,species=TRUE) # preserves species abundance
            # distribution
    test2 <- rndtaxa(bryceveg,plots=TRUE) # preserves plot-level 
                                          # species richness



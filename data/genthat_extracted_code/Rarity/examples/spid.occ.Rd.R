library(Rarity)


### Name: spid.occ
### Title: Occurrences of spiders of Western France at two different
###   scales.
### Aliases: spid.occ
### Keywords: datasets

### ** Examples

data(spid.occ)
head(spid.occ)
# Congruency between regional and western Palearctic occurrences
corPlot(spid.occ, method = "pearson", xlab = "Regional occurrence", 
        ylab = "Western Palearctic occurrence") # Shows the moderate congruency between regional and
                                                # biogeographic estimations of occurrence
# Calculation of multi-scale rarity weights      
rarity.weights <- rWeights(spid.occ, extended = TRUE)
head(rarity.weights)




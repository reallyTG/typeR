library(ndl)


### Name: serbianUniCyr
### Title: Serbian case inflected nouns (in Cyrillic Unicode).
### Aliases: serbianUniCyr
### Keywords: datasets

### ** Examples

## Not run: 
##D data(serbianUniCyr)
##D serbianUniCyr$Cues <- orthoCoding(serbianUniCyr$WordForm, grams=2)
##D serbianUniCyr$Outcomes <- serbianUniCyr$LemmaCase
##D sw <- estimateWeights(cuesOutcomes=serbianUniCyr)
##D sw[1:5,1:5]
##D desiredItems <- unique(serbianUniCyr["Cues"])
##D desiredItems$Outcomes=""
##D activations <- estimateActivations(desiredItems, sw)$activationMatrix
##D rownames(activations) <- unique(serbianUniCyr[["WordForm"]])
##D activations[1:5,1:6]
## End(Not run)




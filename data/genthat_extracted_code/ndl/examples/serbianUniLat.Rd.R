library(ndl)


### Name: serbianUniLat
### Title: Serbian case inflected nouns (in Latin-alphabet Unicode).
### Aliases: serbianUniLat
### Keywords: datasets

### ** Examples

data(serbianUniLat)
serbianUniLat$Cues <- orthoCoding(serbianUniLat$WordForm, grams=2)
serbianUniLat$Outcomes <- serbianUniLat$LemmaCase
sw <- estimateWeights(cuesOutcomes=serbianUniLat)
sw[1:5,1:5]
desiredItems <- unique(serbianUniLat["Cues"])
desiredItems$Outcomes=""
activations <- estimateActivations(desiredItems, sw)$activationMatrix
rownames(activations) <- unique(serbianUniLat[["WordForm"]])
activations[1:5,1:6]




library(ndl)


### Name: serbian
### Title: Serbian case inflected nouns.
### Aliases: serbian
### Keywords: datasets

### ** Examples

data(serbian)
serbian$Cues <- orthoCoding(serbian$WordForm, grams=2)
serbian$Outcomes <- serbian$LemmaCase
sw <- estimateWeights(cuesOutcomes=serbian)
sw[1:5,1:5]
desiredItems <- unique(serbian["Cues"])
desiredItems$Outcomes=""
activations <- estimateActivations(desiredItems, sw)$activationMatrix
rownames(activations) <- unique(serbian[["WordForm"]])
activations[1:5,1:6]




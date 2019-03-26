library(ndl)


### Name: estimateActivations
### Title: Estimation of the activations of outcomes (meanings)
### Aliases: estimateActivations
### Keywords: classif

### ** Examples

  data(serbian)
  serbian$Cues <- orthoCoding(serbian$WordForm, grams=2)
  serbian$Outcomes <- serbian$LemmaCase
  sw <- estimateWeights(cuesOutcomes=serbian)
  sw[1:5,1:6]
  activations <- estimateActivations(unique(serbian["Cues"]), sw)$activationMatrix
  rownames(activations) <- unique(serbian[["WordForm"]])
  activations[1:5,1:6]

  syntax <- c("acc", "dat", "gen", "ins", "loc", "nom", "Pl", "Sg") 
  activations2 <- activations[,!is.element(colnames(activations),syntax)]
  head(rownames(activations2), 50)
  head(colnames(activations2), 8)
  image(activations2, xlab="word forms", ylab="meanings", xaxt="n", yaxt="n")
  mtext(c("yena", "...", "zvuke"), side=1, line=1, at=c(0, 0.5, 1), adj=c(0,0,1))
  mtext(c("yena", "...", "zvuk"), side=2, line=1, at=c(0, 0.5, 1), adj=c(0,0,1))




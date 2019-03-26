library(ndl)


### Name: serbianLex
### Title: Serbian lexicon with 1187 prime-target pairs.
### Aliases: serbianLex
### Keywords: datasets

### ** Examples

# calculate the weight matrix for the full set of Serbian nouns
data(serbian)
serbian$Cues <- orthoCoding(serbian$WordForm, grams=2)
serbian$Outcomes <- serbian$LemmaCase
sw <- estimateWeights(cuesOutcomes=serbian)

# calculate the meaning activations for all unique word forms

desiredItems <- unique(serbian["Cues"])
desiredItems$Outcomes <- ""
activations <- estimateActivations(desiredItems, sw)$activationMatrix
rownames(activations) <- unique(serbian[["WordForm"]])
activations <- activations + abs(min(activations))
activations[1:5,1:6]

# calculate simulated latencies for the experimental materials

data(serbianLex)
syntax <- c("acc", "dat", "gen", "ins", "loc", "nom", "Pl", "Sg")
we <- 0.4 # compound cue weight
strengths <- rep(0, nrow(serbianLex))
for(i in 1:nrow(serbianLex)) {
   target <- serbianLex$Target[i]
   prime <- serbianLex$Prime[i]
   targetLemma <- as.character(serbianLex$TargetLemma[i])
   primeLemma <- as.character(serbianLex$PrimeLemma[i])
   targetOutcomes <- c(targetLemma, primeLemma, syntax)
   primeOutcomes <- c(targetLemma, primeLemma, syntax)
   p <- activations[target, targetOutcomes]
   q <- activations[prime, primeOutcomes]
   strengths[i] <- sum((q^we)*(p^(1-we)))
}
serbianLex$SimRT <- -strengths
lengthPenalty <- 0.3
serbianLex$SimRT2 <- serbianLex$SimRT + 
  (lengthPenalty * (serbianLex$Length>5))

cor.test(serbianLex$SimRT, serbianLex$MeanLogObsRT)
cor.test(serbianLex$SimRT2, serbianLex$MeanLogObsRT)

serbianLex.lm <- lm(SimRT2 ~ Length +  WeightedRE*IsMasc + 
      NormLevenshteinDist + TargetLemmaFreq + 
      PrimeSurfFreq + PrimeCondition, data=serbianLex)
summary(serbianLex.lm)




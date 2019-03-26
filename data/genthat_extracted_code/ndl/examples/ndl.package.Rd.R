library(ndl)


### Name: ndl-package
### Title: Naive Discriminative Learning
### Aliases: ndl-package ndl
### Keywords: package naive discriminative learning

### ** Examples

## Not run: 
##D # Rescorla-Wagner
##D data(lexample)
##D 
##D lexample$Cues <- orthoCoding(lexample$Word, grams=1)
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, traceCue="h",
##D    traceOutcome="hand")
##D plot(lexample.rw)
##D mtext("h - hand", 3, 1)
##D 
##D data(numbers)
##D 
##D traceCues <- c( "exactly1", "exactly2", "exactly3", "exactly4", "exactly5",
##D    "exactly6", "exactly7", "exactly10", "exactly15")
##D traceOutcomes <- c("1", "2", "3", "4", "5", "6", "7", "10", "15")
##D 
##D ylimit <- c(0,1)
##D par(mfrow=c(3,3), mar=c(4,4,1,1))
##D 
##D for (i in 1:length(traceCues)) {
##D   numbers.rw <- RescorlaWagner(numbers, nruns=1, traceCue=traceCues[i],
##D      traceOutcome=traceOutcomes[i])
##D   plot(numbers.rw, ylimit=ylimit)
##D   mtext(paste(traceCues[i], " - ", traceOutcomes[i], sep=""), side=3, line=-1,
##D     cex=0.7)
##D }
##D par(mfrow=c(1,1))
##D 
##D # naive discriminative learning (for complete example, see serbianLex)
##D # This function uses a Unicode dataset.
##D data(serbianUniCyr)
##D serbianUniCyr$Cues <- orthoCoding(serbianUniCyr$WordForm, grams=2)
##D serbianUniCyr$Outcomes <- serbianUniCyr$LemmaCase
##D sw <- estimateWeights(cuesOutcomes=serbianUniCyr,hasUnicode=T)
##D 
##D desiredItems <- unique(serbianUniCyr["Cues"])
##D desiredItems$Outcomes=""
##D activations <- estimateActivations(desiredItems, sw)$activationMatrix
##D rownames(activations) <- unique(serbianUniCyr[["WordForm"]])
##D 
##D syntax <- c("acc", "dat", "gen", "ins", "loc", "nom", "Pl",  "Sg") 
##D activations2 <- activations[,!is.element(colnames(activations), syntax)]
##D head(rownames(activations2),50)
##D head(colnames(activations2),8)
##D 
##D image(activations2, xlab="word forms", ylab="meanings", xaxt="n", yaxt="n")
##D mtext(c("yena", "...", "zvuke"), side=1, line=1, at=c(0, 0.5, 1),  adj=c(0,0,1))
##D mtext(c("yena", "...", "zvuk"), side=2, line=1, at=c(0, 0.5, 1),   adj=c(0,0,1))
##D 
##D # naive discriminative classification
##D data(think)
##D think.ndl <- ndlClassify(Lexeme ~ Person + Number + Agent + Patient + Register,
##D    data=think)
##D summary(think.ndl)
##D plot(think.ndl, values="weights", type="hist", panes="multiple")
##D plot(think.ndl, values="probabilities", type="density")
## End(Not run)




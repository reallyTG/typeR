library(languageR)


### Name: etymology
### Title: Etymological age and regularity in Dutch
### Aliases: etymology
### Keywords: datasets

### ** Examples

## Not run: 
##D data(etymology)
##D 
##D # ---- EtymAge should be an ordered factor, set contrasts accordingly
##D 
##D etymology$EtymAge = ordered(etymology$EtymAge, levels = c("Dutch",
##D "DutchGerman", "WestGermanic", "Germanic", "IndoEuropean")) 
##D options(contrasts=c("contr.treatment","contr.treatment"))
##D 
##D library(rms)
##D etymology.dd = datadist(etymology)
##D options(datadist = 'etymology.dd')
##D 
##D # ---- EtymAge as additional predictor for regularity
##D 
##D etymology.lrm = lrm(Regularity ~ WrittenFrequency + 
##D rcs(FamilySize, 3) + NcountStem + InflectionalEntropy + 
##D Auxiliary + Valency + NVratio + WrittenSpokenRatio + EtymAge, 
##D data = etymology, x = TRUE, y = TRUE)
##D anova(etymology.lrm)
##D 
##D # ---- EtymAge as dependent variable
##D 
##D etymology.lrm = lrm(EtymAge ~ WrittenFrequency + NcountStem +
##D MeanBigramFrequency + InflectionalEntropy + Auxiliary +
##D Regularity + LengthInLetters + Denominative + FamilySize + Valency + 
##D NVratio + WrittenSpokenRatio, data = etymology, x = TRUE, y = TRUE)
##D 
##D # ---- model simplification 
##D 
##D etymology.lrm = lrm(EtymAge ~ NcountStem + Regularity + Denominative, 
##D data = etymology, x = TRUE, y = TRUE)
##D validate(etymology.lrm, bw=TRUE, B=200)
##D 
##D # ---- plot partial effects and check assumptions ordinal regression
##D 
##D plot(Predict(etymology.lrm))
##D plot(etymology.lrm)
##D resid(etymology.lrm, 'score.binary', pl = TRUE)
##D plot.xmean.ordinaly(EtymAge ~ NcountStem, data = etymology)
## End(Not run)




library(languageR)


### Name: finalDevoicing
### Title: Final Devoicing in Dutch
### Aliases: finalDevoicing
### Keywords: datasets

### ** Examples

## Not run: 
##D data(finalDevoicing)
##D library(rpart)
##D 
##D # ---- CART tree 
##D 
##D finalDevoicing.rp = rpart(Voice ~ ., data = finalDevoicing[ , -1])
##D plotcp(finalDevoicing.rp)
##D finalDevoicing.pruned = prune(finalDevoicing.rp, cp = 0.021)
##D plot(finalDevoicing.pruned, margin = 0.1, compress = TRUE)
##D text(finalDevoicing.pruned, use.n = TRUE, pretty = 0, cex=0.8)
##D 
##D # ---- logistic regression 
##D 
##D library(rms)
##D 
##D finalDevoicing.dd = datadist(finalDevoicing)
##D options(datadist='finalDevoicing.dd')
##D 
##D finalDevoicing.lrm = lrm(Voice ~ VowelType + ConsonantType + Obstruent + 
##D Nsyll + Stress + Onset1Type + Onset2Type, data = finalDevoicing)
##D anova(finalDevoicing.lrm)
##D 
##D # ---- model simplification
##D 
##D fastbw(finalDevoicing.lrm)
##D 
##D finalDevoicing.lrm = lrm(Voice ~ VowelType + ConsonantType + 
##D Obstruent + Nsyll, data = finalDevoicing, x = TRUE, y = TRUE)
##D 
##D plot(Predict(finalDevoicing.lrm))
##D 
##D # ---- model validation
##D 
##D validate(finalDevoicing.lrm, B = 200)
## End(Not run)




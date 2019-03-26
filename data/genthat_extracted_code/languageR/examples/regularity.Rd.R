library(languageR)


### Name: regularity
### Title: Regular and irregular Dutch verbs
### Aliases: regularity
### Keywords: datasets

### ** Examples
## Not run: 
##D data(regularity)
##D 
##D # ---- predicting regularity with a logistic regression model
##D 
##D library(rms)
##D regularity.dd = datadist(regularity)
##D options(datadist = 'regularity.dd')
##D 
##D regularity.lrm = lrm(Regularity ~ WrittenFrequency + 
##D rcs(FamilySize, 3) + NcountStem + InflectionalEntropy + 
##D Auxiliary + Valency + NVratio + WrittenSpokenRatio, 
##D data = regularity, x = TRUE, y = TRUE)
##D 
##D anova(regularity.lrm)
##D 
##D # ---- model validation
##D 
##D validate(regularity.lrm, bw = TRUE, B = 200)
##D pentrace(regularity.lrm, seq(0, 0.8, by = 0.05))
##D regularity.lrm.pen = update(regularity.lrm, penalty = 0.6)
##D regularity.lrm.pen
##D 
##D # ---- a plot of the partial effects
##D 
##D plot(Predict(regularity.lrm.pen))
##D 
##D # predicting regularity with a support vector machine
##D 
##D library(e1071)
##D regularity$AuxNum = as.numeric(regularity$Auxiliary)
##D regularity.svm = svm(regularity[, -c(1,8,10)], regularity$Regularity, cross=10)
##D summary(regularity.svm)
## End(Not run)


